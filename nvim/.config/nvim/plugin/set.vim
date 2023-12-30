set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set history=1000
set clipboard+=unnamed
set clipboard+=unnamedplus
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
