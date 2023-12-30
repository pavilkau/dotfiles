" Search binds
nnoremap <Leader>, :GFiles<CR>
nnoremap <Leader>; :Files<CR>
nnoremap <Leader>r :Rg<CR>

let g:fzf_action = {
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }
