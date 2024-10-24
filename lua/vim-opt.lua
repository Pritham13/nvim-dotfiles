vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.g.mapleader = " "
-- Keybindings for switching between buffers
vim.keymap.set('n', 'L', ':bnext<CR>', { noremap = true, silent = true })  -- Shift+L to go to the next buffer
vim.keymap.set('n', 'H', ':bprevious<CR>', { noremap = true, silent = true })  -- Shift+H to go to the previous buffer

-- Keybindings for navigating between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })  -- Ctrl+h to move to the left window
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })  -- Ctrl+l to move to the right window
-- Split window horizontally
vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })

-- Split window vertically
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

