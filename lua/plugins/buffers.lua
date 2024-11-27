-- lua/plugins/buffers.lua
return {
  -- Plugin specifications for buffer management
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. Put your options here, anything missing will use the default:
      animation = true,
      insert_at_start = true,
      -- …etc.
    },
    config = function()
      -- Directly configure barbar.nvim here, no need to require 'plugins.buffers' again
      require('barbar').setup({})
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}

