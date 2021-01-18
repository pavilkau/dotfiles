if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()

colorscheme zenburn

syntax on
highlight LineNr cterm=none ctermbg=none ctermfg=Yellow
highlight CursorLineNr ctermbg=none
highlight Normal ctermbg=none
highlight Visual cterm=none ctermbg=darkgrey ctermfg=cyan

highlight GitGutterAdd    guifg=#00ff00 ctermfg=28
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff1111 ctermfg=160

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set history=1000
set clipboard=unnamedplus
set number relativenumber

set hlsearch
set ignorecase

set updatetime=100

let mapleader="\<SPACE>"

nmap <Leader><S-s> :%s//g<Left><Left>
nmap <Leader>s :%s//c<Left><Left>

nnoremap <silent> <CR> :noh<CR><CR>


" Switch 0 to jump to the first char
nnoremap 0 ^
nnoremap ^ 0

nnoremap <Leader>o :Files<CR> "Search all files
nnoremap <Leader>p :GFiles<CR> "Respect .gitignore
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>r :Rg<CR>


nnoremap <Leader>n :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l


" <leader># Surround a word with #{ruby interpolation}
nnoremap <leader># ciw#{<C-R>"}<ESC>
vnoremap <leader># c#{<C-R>"}<ESC>

" <leader>" Surround a word with "quotes"
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

let g:rooter_patterns = ['.git', 'Makefile', 'app', 'nvim']

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
