vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.autoread = true
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.langmenu = 'en_US'
vim.o.langmenu = 'en_US'
vim.o.mouse = 'a'
vim.o.cursorline = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.modelines = 1
vim.o.termguicolors = true
vim.o.updatetime = 10
vim.o.list = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = '80'
vim.o.background = 'dark'
vim.o.listchars = 'tab:▸ ,trail:·'
vim.o.wildignore = vim.o.wildignore .. '*/tmp/*,*.so,*.swp,*.zip,public/'
-- Folds
vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10
vim.o.foldmethod = 'syntax'
-- Tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Window
vim.o.winbar = '%f'

completion = {
  completeopt = 'menu,menuone,soselect'
}

-- Remaps
vim.api.nvim_set_keymap('n', '<leader>o', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gf', ':tabe <cfile><CR>', { noremap = true })
