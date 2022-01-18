set number
set relativenumber
set autoread
set encoding=utf-8
set langmenu=en_US
let $LANG = 'en_US'
set fileencoding=utf-8
set mouse=a
set cursorline
set showcmd
set showmatch
set modelines=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,public/
set background=dark
set termguicolors
set nocompatible
set updatetime=50
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
filetype plugin on
syntax on

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

let mapleader=" "

nnoremap <leader>ct :r!date "+\%F"<cr>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>t :tabnew<CR>

map gf :tabe <cfile><cr>

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-liquid'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'evidens/vim-twig'
Plug 'webdevel/tabulous'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()
" }}}

" Section folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
" }}}

" Tabs And Spaces {{{
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
" }}}

" tmux {{{
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" }}}

" Prettier {{{
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
" }}}

" Plugin settings {{{
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:prettier#autoformat_config_present = 1

" Telescope
nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gd <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap z= <cmd>lua require('telescope.builtin').spell_suggest()<cr>

" LSP {{{
set completeopt=menu,menuone,noselect

lua << EOF
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

require'lspconfig'.html.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.yamlls.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.denols.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
  {noremap = true}
)
EOF

" }}}


colorscheme onedark
" vim:foldmethod=marker:foldlevel=0
