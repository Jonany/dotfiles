-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Run the current file
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', { noremap = true, })
-- Run the current file
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { noremap = true, })
-- Run the current selection
vim.keymap.set('v', '<leader>x', ':lua<CR>', { noremap = true, })

-- Replacements for :CMD stuff
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, })
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { noremap = true, })

-- window controls
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, })
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, })

-- indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, })
vim.keymap.set('v', '>', '>gv', { noremap = true, })

-- delete means delete not cut
vim.keymap.set({ 'n', 'v' }, 'd', ''_d', { noremap = true, })
vim.keymap.set('n', 'dd', ''_dd', { noremap = true, })
vim.keymap.set('x', 'p', ''_dP', { noremap = true })
--vim.keymap.set('v', 'iwp', 'iw'_dP', { noremap = true, })

vim.keymap.set('n', 'U', '<C-r>', { noremap = true, })
