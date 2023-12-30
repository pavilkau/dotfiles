if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'rebelot/kanagawa.nvim'

" Generic
Plug 'tomtom/tcomment_vim'
Plug 'kassio/neoterm'
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'theprimeagen/harpoon'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'mark-maxwell/vim-spec-split'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-rooter'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-rails'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'dundalek/lazy-lsp.nvim'

" Svelte
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'coc-extensions/coc-svelte'

" Go
Plug 'jodosha/vim-godebug'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" kanagawa gruvbox zenburn elrodeo molokai
colorscheme kanagawa

" Nerdtree config
nnoremap <Leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=80

" Neoterm mappings
tnoremap <Esc> <C-\><C-n>
if has('terminal') || has('nvim')
  let g:test#strategy = 'neoterm'
  let g:neoterm_default_mod = 'rightbelow vertical'
  nmap <silent> <leader><Esc> :Ttoggle<CR><C-L>
endif

