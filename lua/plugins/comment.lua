return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                -- Add any options here
                toggler = {
                    line = 'gcc',  -- Line-comment toggle keymap
                    block = 'gbc', -- Block-comment toggle keymap
                },
                opleader = {
                    line = 'gc',  -- Line-comment keymap
                    block = 'gb', -- Block-comment keymap
                },
                extra = {
                    above = 'gcO', -- Add comment on the line above
                    below = 'gco', -- Add comment on the line below
                },
            })
        end,
    },
}

