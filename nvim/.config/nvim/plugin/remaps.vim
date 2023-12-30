let mapleader="\<SPACE>"

" Map esc
tmap jk <Esc>
tmap kj <Esc>
imap jk <Esc>
imap kj <Esc>

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
