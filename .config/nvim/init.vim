if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()


colorscheme gruvbox
syntax enable
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set number
set history=1000


