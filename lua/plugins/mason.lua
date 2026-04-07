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
        -- ensure_installed = { "lua_ls", "clangd", "veridian" },
        ensure_installed = { "lua_ls", "clangd" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

      local diagnostics_enabled = true
      vim.keymap.set("n", "<leader>td", function()
        diagnostics_enabled = not diagnostics_enabled
        if diagnostics_enabled then
          vim.diagnostic.enable()
        else
          vim.diagnostic.disable()
        end
      end, { noremap = true, silent = true })

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "-j=0", -- Use "-j=0" instead of just "-j"
          '--fallback-style="{BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never, TabWidth: 4}"',
        },
        filetypes = { "c", "cpp", "cc", "h", "hpp", "mpp", "ixx" },
        on_attach = on_attach,
      })

      -- vim.lsp.config("veridian", {
      --   cmd = { "veridian" },
      --   filetypes = { "verilog", "systemverilog" },
      --   root_dir = function(fname)
      --     local util = require("lspconfig.util")
      --     local root_pattern = util.root_pattern("veridian.yml", ".git")
      --     local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
      --     return root_pattern(filename) or util.path.dirname(filename)
      --   end,
      --   on_attach = on_attach,
      -- })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      -- vim.lsp.enable("veridian")
    end,
  },
}
