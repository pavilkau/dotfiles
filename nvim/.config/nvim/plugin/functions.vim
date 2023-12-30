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
