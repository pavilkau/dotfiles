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

nnoremap <CR> :noh<CR><CR>


" Switch 0 to jump to the first char
nnoremap 0 ^
nnoremap ^ 0

nnoremap <Leader>o :Files<CR>
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

