vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set nu")
-- vim.cmd("set autoindent")
-- vim.cmd("set smartindent")
-- relative number
-- vim.wo.relativenumber = true
vim.cmd("set tabstop=2")
vim.g.mapleader = " "
-- Keybindings for switching between buffers
vim.keymap.set('n', 'L', ':bnext<CR>', { noremap = true, silent = true })     -- Shift+L to go to the next buffer
vim.keymap.set('n', 'H', ':bprevious<CR>', { noremap = true, silent = true }) -- Shift+H to go to the previous buffer

-- Keybindings for navigating between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Ctrl+h to move to the left window
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Ctrl+l to move to the right window
-- Split window horizontally
vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set({'i'}, '<C-s>', '<C-o>:wa<ENTER>')
vim.keymap.set({'n'}, '<C-s>', ':wa<ENTER>')

-- Split window vertically
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
