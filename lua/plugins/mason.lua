return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "verible", "clangd", "veridian" }, -- Added "veridian"
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

            -- Diagnostics toggle
            local diagnostics_enabled = true
            vim.keymap.set('n', '<leader>td', function()
                diagnostics_enabled = not diagnostics_enabled
                if diagnostics_enabled then
                    vim.diagnostic.enable()
                else
                    vim.diagnostic.disable()
                end
            end, { noremap = true, silent = true })

            -- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)  -- Use format instead of formatting
            end

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ on_attach = on_attach })
            lspconfig.verible.setup({
                filetypes = { "verilog", "systemverilog" },
                on_attach = on_attach
            })
            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "-j", "4",
                    "--fallback-style=llvm"
                },
                filetypes = { "c", "cpp", "cc", "mpp", "ixx" },  -- Corrected from "iletypes" to "filetypes"
                on_attach = on_attach
            })

            -- New Veridian setup
            local lspconfutil = require 'lspconfig/util'
            local root_pattern = lspconfutil.root_pattern("veridian.yml", ".git")
            lspconfig.veridian.setup {
                cmd = { 'veridian' },
                root_dir = function(fname)
                    local filename = lspconfutil.path.is_absolute(fname) and fname
                        or lspconfutil.path.join(vim.loop.cwd(), fname)
                    return root_pattern(filename) or lspconfutil.path.dirname(filename)
                end,
            }
        end,
    }
}

