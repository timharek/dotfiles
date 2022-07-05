vim.g.mapleader = " "

-- Sets
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

-- Remaps
vim.api.nvim_set_keymap('n', '<leader>o', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gf', ':tabe <cfile><CR>', { noremap = true })

-- Plug
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-liquid'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'navarasu/onedark.nvim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'evidens/vim-twig'
Plug 'webdevel/tabulous'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

-- For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
vim.call('plug#end')

-- Plugin settings
vim.g["user_emmet_leader_key"] = '<c-e>'
vim.g["user_emmet_expandabbr_key"] = '<c-e>'
vim.g["airline#extension#tabline#formatter"] = 'unique_tail'

-- Prettier
vim.g["prettier#quickfix_enabled"] = 0
vim.g["prettier#config#prose_wrap"] = 'always'

-- Telescope
vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require('telescope.builtin').git_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', "<cmd>lua require('telescope.builtin').git_status()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fs', "<cmd>lua require('telescope.builtin').grep_string()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', 'z=', "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", { noremap = true })

completion = {
  completeopt = 'menu,menuone,soselect'
}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    -- For vsnip user.
    { name = 'vsnip' },

    { name = 'buffer' },
  }
})

require'lspconfig'.pyright.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.tailwindcss.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}


require'lspconfig'.yamlls.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.denols.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
  {noremap = true}
)

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "go", "html", "css", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

require('onedark').load()
