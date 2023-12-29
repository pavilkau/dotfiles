if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'kassio/neoterm'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rhubarb'
Plug 'morhetz/gruvbox'

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

call plug#end()

syntax on
set termguicolors
colorscheme gruvbox
set background=dark

highlight LineNr  guibg=#3b3b3b ctermfg=Yellow
highlight CursorLineNr ctermfg=Red
highlight SignColumn ctermbg=none
highlight GitGutterAdd    guibg=#3b3b3b guifg=#00aa00 ctermfg=40
highlight GitGutterChange guibg=#3b3b3b guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guibg=#3b3b3b guifg=#ff1111 ctermfg=9
highlight ColorColumn ctermbg=darkgrey guibg=#666666

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

" Search binds
nnoremap <Leader>, :GFiles<CR>
nnoremap <Leader>; :Files<CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=80

nnoremap <silent> <Leader>p :call Vspec()<CR>

" Neoterm mappings
tnoremap <Esc> <C-\><C-n>
if has('terminal') || has('nvim')
  let g:test#strategy = 'neoterm'
  let g:neoterm_default_mod = 'rightbelow vertical'
  nmap <silent> <leader><Esc> :Ttoggle<CR><C-L>
endif


let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" Rails testing config
autocmd BufLeave term://* stopinsert
nmap <silent> <Leader>tl :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ta :TestSuite<CR>
nmap <silent> <Leader>tr :TestLast<CR>

" Git fugitive config
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

nnoremap <silent> <C-q> :call CloseWindowOrKillBuffer()<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
let g:rooter_patterns = ['.git', '!^engines', 'Makefile', 'nvim']
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


lua << EOF
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


lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
