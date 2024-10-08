if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'rebelot/kanagawa.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/everforest'
Plug 'junegunn/seoul256.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'rose-pine/neovim'
Plug 'mswift42/vim-themes'

" Generic
Plug 'tomtom/tcomment_vim'
Plug 'kassio/neoterm'
Plug 'dense-analysis/ale'
Plug 'bodymindarts/vim-twitch'

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'

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
Plug 'dundalek/lazy-lsp.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

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

" kanagawa gruvbox zenburn 
" papercolor-theme everforest seoul256 ayu-theme neovim
"
" let g:seoul256_background = 254
set background=dark

colorscheme gruvbox
" Color
syntax on
set termguicolors


" highlight LineNr  guibg=#3b3b3b ctermfg=Yellow
" highlight GitGutterAdd    guibg=#3b3b3b guifg=#00aa00 ctermfg=40
" highlight GitGutterChange guibg=#3b3b3b guifg=#bbbb00 ctermfg=3
" highlight GitGutterDelete guibg=#3b3b3b guifg=#ff1111 ctermfg=9
hi Visual term=reverse cterm=reverse guibg=#005544
highlight CursorLineNr ctermfg=Red guifg=#aaaa55
set cursorline
set cursorlineopt=number
highlight SignColumn ctermbg=none
highlight GitGutterAdd    guifg=#00aa00 ctermfg=40
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff1111 ctermfg=9
highlight ColorColumn ctermfg=Red guifg=#ffffff guibg=#99aa99

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



" Sets
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

" Remaps
let mapleader="\<SPACE>"

" Map esc
" tmap jk <Esc>
" tmap kj <Esc>
" imap jk <Esc>
" imap kj <Esc>

" Find and replace
nmap <Leader><S-s> :%s//gc<Left><Left><Left>
nmap <Leader>s :s//g<Left><Left>

nnoremap <silent> <leader>/ :nohlsearch<CR>

map :W :w
map :a :A

" Del all buffers but current
map <leader>o :%bd\|e\|bd#<cr>

" Format whole file
map <leader>= mpgg=G'p

" Switch 0 to jump to the first char
nnoremap 0 ^
nnoremap ^ 0

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split from buffer list
nnoremap <leader>v :vnew<CR>


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

" yank file path
nnoremap <silent> <leader>cf :let @+=expand("%")<CR>

" source vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>




" Search binds
nnoremap <Leader>, :Files<CR>
nnoremap <Leader>; :GFiles<CR>
nnoremap <Leader>r :Rg<CR>

let g:fzf_action = {
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }



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

" Ale
" Set specific linters
let g:ale_linters = {}
let g:ale_linters['ruby'] = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" Twitch spec switching
nnoremap <silent> <C-s> :Twitch<CR>


" Rails testing config
autocmd BufLeave term://* stopinsert
nmap <silent> <Leader>tl :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ta :TestSuite<CR>
nmap <silent> <Leader>tr :TestLast<CR>

au BufNewFile,BufRead Jenkinsfile setf groovy


" Rooter
let g:rooter_patterns = ['.git', '!^engines', 'Makefile', 'nvim']


" Go
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
      \ }



" Functions
nnoremap <silent> <C-q> :call CloseWindowOrKillBuffer()<CR>

function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  let number_of_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

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



" LSP
lua <<EOF
local nvim_lsp = require('lspconfig')
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
nvim_lsp.solargraph.setup {
  cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/solargraph", 'stdio' },
  filetypes = {
    "ruby"
  },
  flags = {
    debounce_text_changes = 150
  },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts),
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts),
  vim.keymap.set('n', 'gr', vim.lsp.buf.references),
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = false,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
    }
  }
EOF


" Cmp
lua <<EOF
local cmp = require('cmp')

cmp.setup({
snippet = {
  expand = function(args)
  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
['<CR>'] = cmp.config.disable,
['<C-b>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
['<C-Space>'] = cmp.mapping.complete(),
['<C-e>'] = cmp.mapping.abort(),
['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
{ name = 'nvim_lsp' },
{ name = 'vsnip' }, -- For vsnip users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
  { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
  })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
  })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
  { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['solargraph'].setup {
  capabilities = capabilities
}
EOF


" Fugitive
nmap <leader>gb :Git blame<CR>
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
