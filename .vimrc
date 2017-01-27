set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" V U N D L E  START
"
" let Vundle manage Vundle, required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

" Latex plugin
Plugin 'lervag/vimtex.git'

Plugin 'Shougo/neocomplete'

Plugin 'scrooloose/nerdtree'

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" V U N D L E  STOP
" Put your non-Plugin stuff after this line
set number	  "show line numbers
filetype plugin indent on "Detect filetype
syntax on "Syntax highlighting
set wrap "Soft wrap of lines.

"My color scheme and font size
set t_Co=256      "Colors?
colorscheme hybrid
set background=dark
set guifont=Menlo\ Regular:h15
"Indentation
set tabstop=2     "show exisiting tabs with 4 spaces width
set shiftwidth=2  "when indenting, use 2 spaces width
set expandtab     " On pressing tab, insert <shiftwidth> spaces

let g:tex_flavor = 'latex'  "Needed to load vimtex on startup on Macbook
set number                  "Enable line numbering.
set autoread                "Automatically refresh files that haven't been changed by VIM.

set clipboard=exclude:.*        "Only if vim is slow on startup. Do not connect to X11. Same as vim -X.

" Vimtex configuration
" Insert mode mapping imap
" Add custom mapping through vimtex#imap#add_map
"call vimtex#imaps#add_map({
"  \ 'lhs' : 'test',
"  \ 'rhs' : '\tested',
"  \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
"  \})
