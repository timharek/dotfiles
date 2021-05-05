set runtimepath+=~/.vim_runtime
set number
set relativenumber
set autoread
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set cursorline
set showcmd
set showmatch
set modelines=1
syntax on

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

let g:ctrlp_map = '<c-p>'

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
set nocompatible              " be iMproved, required
filetype off                  " required
set updatetime=100

packloadall


nnoremap <silent> <C-l> :nohl<CR><C-l>

" Remappings {{{

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" }}}

" Section folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" }}}

" Vundle plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mattn/emmet-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-liquid'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
let g:gitgutter_enabled = 1 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
colorscheme onedark
set background=dark


" vim:foldmethod=marker:foldlevel=0
