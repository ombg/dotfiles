" 
" If you run old vim, no plugins are loaded
"
if v:version < 704
  finish
endif
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

"Plugin 'flazz/vim-colorschemes'

" Dark powered asynchronous completion framework for neovim
Plugin 'Shougo/deoplete.nvim'
" {{{
  " Let deoplete find the default python environment.
  " E.g., set it to Tensorflow virtual env, when using TF.
  let g:python_host_prog =  '/Users/oliver/anaconda/envs/tensorflow/bin/python'
  let g:python3_host_prog = '/Users/oliver/anaconda/envs/tensorflow/bin/python'
" }}}

" A command-line fuzzy finder written in Go 
" Both plugins are needed.
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

" Latex plugin
Plugin 'lervag/vimtex.git'

Plugin 'scrooloose/nerdtree'

" Vim looks better with airline. Nothing more nothing less.
Plugin 'vim-airline/vim-airline'

" pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'

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
set nowrap "Soft wrap of lines.
" Enable scrolling
set mouse=a
set encoding=utf-8

"
"My color scheme and font size
"
set t_Co=256      "Colors?
"colorscheme carbonized
"set background=dark
set guifont=Source\ Code\ Pro\ Semibold:h15

" Operations on buffers
" Shows all exisiting buffers and prompts user to enter buf number.
nnoremap fv :ls<cr>:b
" Go to previous buffer
nnoremap ff :b#<cr>
"
"Indentation
"
set tabstop=2     "show exisiting tabs with 2 spaces width
set shiftwidth=2  "when indenting, use 2 spaces width
set expandtab     " On pressing tab, insert <shiftwidth> spaces

" tab navigation
map tm :tabm 
map tt :tabnew 
map tn :tabn<CR>
map tp :tabp<CR>
map ts :tab split<CR>

"Misc mappings
nnoremap <leader>p oimport pdb; pdb.set_trace()<Esc>

"set clipboard=exclude:.*        "Only if vim is slow on startup. Do not connect to X11. Same as vim -X.

"
" deoplete configuration
" 
" Activate deoplete by default
let g:deoplete#enable_at_startup = 1

"
" Latex configuration
"
" vimtex_view_* defines the used PDF viewer and enables forward search
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    "If you are on macOS do this
    let g:vimtex_view_general_viewer
          \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
  
    " This adds a callback hook that updates Skim after compilation
    let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
    function! UpdateSkim(status)
      if !a:status | return | endif
  
      let l:out = b:vimtex.out()
      let l:tex = expand('%:p')
      let l:cmd = [g:vimtex_view_general_viewer, '-r']
      if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
      endif
      if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
      elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
      else
        call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
      endif
    endfunction
  else
    "If you are on Linux do this
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    let g:vimtex_view_general_options_latexmk = '--unique'
  endif
endif

let g:tex_flavor = 'latex'  "Needed to load vimtex on startup on Macbook
"Vim handles the following file types as latex files as well.
augroup set_latex_filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.pgf     set filetype=tex
    autocmd BufRead,BufNewFile *.tikz    set filetype=tex
    autocmd BufRead,BufNewFile *.pdf_tex set filetype=tex
augroup END

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
