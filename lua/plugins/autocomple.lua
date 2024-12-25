-- ~/.config/nvim/lua/plugins/autocomple.lua

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",   -- Load when entering insert mode
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			check_ts = true,                                       -- Enable treesitter integration
			ts_config = {
				lua = { "string" },                                  -- Don't add pairs in lua string treesitter nodes
				javascript = { "template_string" },                  -- Don't add pairs in javascript template_string treesitter nodes
				java = false,                                        -- Don't check treesitter on java
			},
			disable_filetype = { "TelescopePrompt", "vim" },       -- Disable in specific file types
		})

		-- Optional: Integrate with nvim-cmp if you're using it
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
