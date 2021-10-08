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

nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gd <cmd>lua require('telescope.builtin').lsp_references()<cr>

" }}}

" LSP's {{{
lua << EOF
require'lspconfig'.pyright.setup{}

require'lspconfig'.tailwindcss.setup{}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

require'lspconfig'.yamlls.setup{}

require'lspconfig'.denols.setup{}
EOF
" }}}


colorscheme onedark
" vim:foldmethod=marker:foldlevel=0
