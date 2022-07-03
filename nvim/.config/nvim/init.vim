if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tomtom/tcomment_vim'
Plug 'kassio/neoterm'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-endwise'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rhubarb'
Plug 'mark-maxwell/vim-spec-split'
Plug 'morhetz/gruvbox'
call plug#end()

syntax on
colorscheme gruvbox

highlight LineNr  guibg=#3b3b3b ctermfg=Yellow
highlight CursorLineNr ctermfg=Red
highlight SignColumn ctermbg=none
highlight GitGutterAdd    guibg=#3b3b3b guifg=#00aa00 ctermfg=40
highlight GitGutterChange guibg=#3b3b3b guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guibg=#3b3b3b guifg=#ff1111 ctermfg=9
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

" Change embedded terminal colors
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'


set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set history=1000
set clipboard=unnamedplus
set number relativenumber

set autoread
set scrolloff=8

set hlsearch
set ignorecase
set updatetime=50
set nocompatible

set noswapfile
set colorcolumn=80

setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

filetype off

let &runtimepath.=',~/.vim/bundle/neoterm'

filetype plugin on

let mapleader="\<SPACE>"
nmap <Leader><S-s> :%s//gc<Left><Left><Left>
nmap <Leader>s :s//g<Left><Left>

nnoremap <silent> <leader>/ :nohlsearch<CR>

imap jk <Esc>
imap kj <Esc>

" Del all buffers but current
map <leader>o :%bd\|e\|bd#<cr>

" Search binds
nnoremap <Leader>, :Files<CR>
nnoremap <Leader>; :GFiles<CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>n :NERDTreeFind<CR>

nnoremap <silent> <Leader>p :call Vspec()<CR>

" Neoterm mappings
tnoremap <Esc> <C-\><C-n>
if has('terminal') || has('nvim')
  let g:test#strategy = 'neoterm'
  let g:neoterm_default_mod = 'rightbelow vertical'
  nmap <silent> <leader><Esc> :Ttoggle<CR>
endif

autocmd BufLeave term://* stopinsert
nmap <silent> <Leader>tl :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ta :TestSuite<CR>
nmap <silent> <Leader>tr :TestLast<CR>

nmap <leader>gb :Git blame<CR>
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

" Switch 0 to jump to the first char
nnoremap 0 ^
nnoremap ^ 0

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split from buffer list
nnoremap <leader>vb :ls<cr>:vertical sb<space>
nnoremap <leader>hb :ls<cr>:sb<space>


" Surround binds
" <leader># Surround a word with #{ruby interpolation}
nnoremap <leader># ciw#{<C-R>"}<ESC>
vnoremap <leader># c#{<C-R>"}<ESC>

" <leader>' Surround a word with 'quotes'
nnoremap <leader>" ciw"<C-R>""<ESC>
vnoremap <leader>" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
nnoremap <leader>' ciw'<C-R>"'
vnoremap <leader>' c'<C-R>"'<ESC>

" <leader>) Surround a word with (parens)
" The difference is in whether a space is put in
nnoremap <leader>( ciw(<C-R>")<ESC>
nnoremap <leader>) ciw(<C-R>")<ESC>
vnoremap <leader>( c( <C-R>" )<ESC>
vnoremap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
nnoremap <leader>] ciw[<C-R>"]<ESC>
nnoremap <leader>[ ciw[<C-R>"]<ESC>
vnoremap <leader>] c[ <C-R>" ]<ESC>
vnoremap <leader>[ c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
nnoremap <leader>} ciw{<C-R>"}<ESC>
nnoremap <leader>{ ciw{<C-R>"}<ESC>
vnoremap <leader>} c{ <C-R>" }<ESC>
vnoremap <leader>{ c{<C-R>"}<ESC>

nnoremap <silent> <C-q> :call CloseWindowOrKillBuffer()<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
let g:rooter_patterns = ['.git', '!^engines', 'app', 'Makefile', 'nvim']
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }


" Set specific linters
let g:ale_linters = {}
let g:ale_linters['ruby'] = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  let number_of_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  elseif number_of_buffers > 1
    bdelete!
  else
    quit
  endif
endfunction

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

