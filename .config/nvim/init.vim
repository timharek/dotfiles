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
syntax on

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
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

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}

" Plugin settings {{{
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" }}}

colorscheme onedark
" vim:foldmethod=marker:foldlevel=0
