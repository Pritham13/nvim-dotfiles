return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	  "MunifTanjim/nui.nvim"
    },
    config = function() 
        -- Keybinding to reveal the filesystem on the left
        vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>')

        -- Neo-tree setup
        require("neo-tree").setup({
            filesystem = {
                window = {
                    mappings = {
                        -- Use 'l' to open a file or folder
                        ["l"] = "open",
                        -- Optional: Use 'h' to close a folder
                        ["h"] = "close_node",
                    }
                }
            }
        })
    end
}

