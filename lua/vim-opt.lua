vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
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

-- Split window vertically
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.wo.relativenumber = true
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>iv', function()
  -- Run iverilog on the current file and send output to the quickfix list
  vim.cmd("cexpr system('iverilog -o testbench_out.out % &&  ./testbench_out')")
  -- Open the quickfix list if there are any errors or warnings
  vim.cmd("cwindow")
end, { desc = "Run Iverilog Testbench and Show Errors" })
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a' 


