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

" Super simple vim plugin to show the list of buffers in the command bar.
"Plugin 'bling/vim-bufferline'

" Vim looks better with airline. Nothing more nothing less.
Plugin 'vim-airline/vim-airline'

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
set encoding=utf-8

"
"My color scheme and font size
"
set t_Co=256      "Colors?
colorscheme hybrid
set background=dark
set guifont=Menlo\ Regular:h15

"
"Indentation
"
set tabstop=2     "show exisiting tabs with 2 spaces width
set shiftwidth=2  "when indenting, use 2 spaces width
set expandtab     " On pressing tab, insert <shiftwidth> spaces

let g:tex_flavor = 'latex'  "Needed to load vimtex on startup on Macbook
set number                  "Enable line numbering.
set autoread                "Automatically refresh files that haven't been changed by VIM.

"set clipboard=exclude:.*        "Only if vim is slow on startup. Do not connect to X11. Same as vim -X.

" LaTeX mappings
" put \begin{} \end{} tags tags around the current word
"map  <C-B>      YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
"map! <C-B> <ESC>YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA 

"
" Usage with Python
" 
" Needs YouCompleteMe plugin, which is based on jedi, for autocompletion.
let g:ycm_python_binary_path = '/home/meyn_ol/anaconda3/envs/tf/bin/python'

"
" vim-airline config START
" 

" Let airline statusbar appear all the time
set laststatus=2
" Leave Insert Mode more quickly when pressing ESC.
set ttimeoutlen=50
" Get rid of the default mode indicator
set noshowmode

"The following symbol stuff is needed to get rid of strange symbols
"ASFAIK no patching of fonts is required for airline.
" See also https://www.banquise.org/software/bye-bye-vim-powerline-hello-airline/
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"
" vim-airline config STOP
"

