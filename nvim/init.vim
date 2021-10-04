"
"Change the hot button to trigger FZF stuff
let g:mapleader = "\<Space>"
"" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" A command-line fuzzy finder written in Go 
" Both plugins are needed.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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

" All of your Plugins must be added before the following line which does:
" Initialize plugin system
call plug#end()

"
" Put your non-Plugin stuff after this line

set number "show line numbers
filetype plugin indent on "Detect filetype
syntax on "Syntax highlighting
set nowrap "Soft wrap of lines.
set mouse=a "Enable scrolling

set encoding=utf-8

"
"My color scheme and font size
"
"set t_Co=256      "Colors?
"colorscheme carbonized
"set background=dark
"set guifont=Source\ Code\ Pro\ Semibold:h15

" Operations on buffers
" Shows all exisiting buffers and prompts user to enter buf number.
nnoremap fv :ls<cr>:b
" Go to previous buffer
nnoremap ff :b#<cr>

"Indentation
"
set tabstop=4     "show exisiting tabs with 2 spaces width
set shiftwidth=4  "when indenting, use 2 spaces width
set expandtab     " On pressing tab, insert <shiftwidth> spaces

" tab navigation
map tm :tabm 
map tt :tabnew 
map tn :tabn<CR>
map tp :tabp<CR>
map ts :tab split<CR>

"Misc mappings
" Change to directory of current file.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

