-- return {
--   "RRethy/vim-illuminate",
--   config = function()
--     require('illuminate').configure({
--       -- providers: provider used to get references in the buffer, ordered by priority
--       providers = {
--         'lsp',
--         'treesitter',
--         'regex',
--       },
--       -- delay in milliseconds
--       delay = 100,
--       -- filetype specific overrides
--       filetype_overrides = {},
--       -- filetypes to not illuminate (overrides allowlist)
--       filetypes_denylist = {
--         'dirbuf',
--         'dirvish',
--         'fugitive',
--       },
--       -- filetypes to illuminate (overridden by denylist)
--       filetypes_allowlist = {},
--       -- modes to not illuminate (overrides allowlist)
--       modes_denylist = {},
--       -- modes to illuminate (overridden by denylist)
--       modes_allowlist = {},
--       -- regex provider syntax denylist
--       providers_regex_syntax_denylist = {},
--       -- regex provider syntax allowlist
--       providers_regex_syntax_allowlist = {},
--       -- illuminate under the cursor
--       under_cursor = true,
--       -- cutoff for large files (number of lines)
--       large_file_cutoff = 10000,
--       -- config overrides for large files (nil disables illuminate)
--       large_file_overrides = nil,
--       -- minimum number of matches to highlight
--       min_count_to_highlight = 1,
--       -- callback to enable/disable illumination
--       should_enable = function(bufnr) return true end,
--       -- regex case sensitivity
--       case_insensitive_regex = false,
--       -- disable default keymaps
--       disable_keymaps = false,
--     })
--   end,
-- }
--
-- ~/.config/nvim/lua/plugins/mini_cursorword.lua
return {
  'echasnovski/mini.cursorword',
  version = false, -- use 'false' for main branch, or '*' for stable
  config = function()
    require('mini.cursorword').setup()
  end,
}

