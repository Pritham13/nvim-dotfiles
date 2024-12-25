-- return{
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000 ,
--     config = function()
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }
-- Lazy
-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	priority = 1000, -- Ensure it loads first
-- 	config = function()
-- 		vim.cmd.colorscheme "onedark"
-- 	end
-- }
return {
  {
    "navarasu/onedark.nvim",
    config = function()
      -- Set the colorscheme to OneDark
      vim.cmd.colorscheme("onedark")

      -- Optional: Additional configuration for OneDark
      require('onedark').setup {
        style = 'darker',              -- Choose your preferred style
        transparent = false,           -- Set to true for a transparent background
        term_colors = true,            -- Enable terminal colors
        ending_tildes = false,         -- Show end-of-buffer tildes
      }
      require('onedark').load()        -- Load the configured theme
    end,
  },
}
