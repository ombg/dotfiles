let g:mapleader = "\<Space>"
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

" This plugin provides C++ debbuging integration using lldb
"DO NOT USE ON UBUNTU
"Plugin  'gilligan/vim-lldb' 

" This plugin provides C++ debbuging integration using g++
Plugin 'vim-scripts/Conque-GDB'

" Use GNU GLOBAL gtags
Plugin 'joereynolds/gtags-scope'
" {{{
  "Search both cscopes database and the tags file
  set cscopetag
  " Cscope settings (Not sure if it really needs the vim plugin for this.)
  " This function creates a list of al references of the word under the cursor.
  function! Csc()
    cscope find c <cword>
    copen
  endfunction
  " Map a shortcut to use it.
  command! Csc call Csc()
" }}}
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
Plugin 'Valloric/YouCompleteMe'

" Vim looks better with airline. Nothing more nothing less.
Plugin 'vim-airline/vim-airline'

"Python syntax highlighting for VIM
Plugin 'vim-python/python-syntax'
" {{{
  "Enable all syntax highlighting features
  let g:python_highlight_all = 1
" }}}

" Syntastic is a syntax checking plugin for literarly all languages.
" Plugin 'vim-syntastic/syntastic'
" {{{
"  autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*
"  
"  let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
"  let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 0
" }}}

" Integration of FZF, a fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" V U N D L E  STOP
" Put your non-Plugin stuff after this line
filetype plugin indent on "Detect filetype
syntax on "Syntax highlighting

"
" Code formatting
"
set tabstop=4     "show exisiting tabs with 2 spaces width
set shiftwidth=4  "when indenting, use 2 spaces width
set expandtab     " On pressing tab, insert <shiftwidth> spaces
set autoindent    " copy indent from current line when starting a new line
set number	  "show line numbers
set wrap "Soft wrap of lines.
set encoding=utf-8
set backspace=indent,eol,start " make backspace more powerful
"Shows tabs and trailing whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set mouse=a "Enable mouse scrolling

"Overriding tab settings made by ftplugin.
"SetupPython() is then called at the following location:
"~/.vim/after/ftplugin/python.vim
"See https://stackoverflow.com/a/21074056/166435 for details.
"function! SetupPython()
"  " Here, you can have the final say on what is set.  So
"  " fixup any settings you don't like.
"  setlocal softtabstop=2
"  setlocal tabstop=2
"  setlocal shiftwidth=2
"  set expandtab
"  set autoindent
"endfunction
"command! -bar SetupPython call SetupPython()

"
"My color scheme 
"
set t_Co=256      "Colors?
colorscheme hybrid
set background=dark

" Operations on buffers
" Shows all exisiting buffers and prompts user to enter buf number.
nnoremap fv :ls<cr>:b
" Go to previous buffer
nnoremap ff :b#<cr>

" Change working directory to the active file's directory.
nnoremap fd :cd %:p:h<cr>
" tab navigation
map tm :tabm 
map tt :tabnew 
map tn :tabn<CR>
map tp :tabp<CR>
map ts :tab split<CR>
"map <C-S-Right> :tabn<CR>
"imap <C-S-Right> <ESC>:tabn<CR>
"map <C-S-Left> :tabp<CR>
"imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with Alt key( aka meta or M) plus arrows
map <silent><M-Right> <c-w>l
map <silent><M-Left> <c-w>h
map <silent><M-Up> <c-w>k
map <silent><M-Down> <c-w>j
imap <silent><M-Right> <ESC><c-w>l
imap <silent><M-Left> <ESC><c-w>h
imap <silent><M-Up> <ESC><c-w>k
imap <silent><M-Down> <ESC><c-w>j


"set clipboard=exclude:.*        "Only if vim is slow on startup. Do not connect to X11. Same as vim -X.

"
" Latex configuration
"
" vimtex_view_* defines the used PDF viewer and enables forward search
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" Vimtex uses YouCompleteMe for auto completion of Latex code
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]

let g:tex_flavor = 'latex'  "Needed to load vimtex on startup on Macbook
"Vim handles the following file types as latex files as well.
augroup set_latex_filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.pgf     set filetype=tex
    autocmd BufRead,BufNewFile *.tikz    set filetype=tex
    autocmd BufRead,BufNewFile *.pdf_tex set filetype=tex
augroup END
"
" Usage with Python
" 
" Needs YouCompleteMe plugin, which is based on jedi, for autocompletion.
let g:ycm_python_binary_path = '/home/meyn_ol/anaconda3/envs/tf/bin/python'
" Note: This call makes only YCM plugin aware of tensorflow anaconda env.
" vim uses same python as current user.

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

