-- prevent typo when pressing `wq` or `q`
vim.cmd [[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]

-- Text behaviour
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    - 'o'    -- don't insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt_local.fo:remove("o")
    vim.opt_local.fo:remove("r")
  end,
})

-- read Jenkinsfile correctly as groovy
vim.cmd[[
au BufNewFile,BufRead Jenkinsfile setf groovy
]]

-- Set column only on active window
vim.cmd [[
augroup BgHighlight
autocmd!
autocmd WinEnter * set colorcolumn=80
autocmd WinLeave * set colorcolumn=0
augroup END
]]

vim.cmd [[augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
]]

-- Open file on github
vim.cmd [[
noremap <silent> <leader>gB V:<c-u>call OpenCurrentFileInGithub()<cr>
xnoremap <silent> <leader>gB :<c-u>call OpenCurrentFileInGithub()<cr>

function! OpenCurrentFileInGithub()
  let file_dir = expand('%:h')
  let git_root = system('cd ' . file_dir . '; git rev-parse --show-toplevel | tr -d "\n"')
  let file_path = substitute(expand('%:p'), git_root . '/', '', '')
  let git_remote = system('cd ' . file_dir . '; git remote get-url origin')
  let repo_path = matchlist(git_remote, ':\(.*\)\.')[1]
  let url = 'https://github.com/' . repo_path . '/blob/master' . '/' . file_path
  let first_line = getpos("'<")[1]
  let url .= '#L' . first_line
  let last_line = getpos("'>")[1]
  if last_line != first_line | let url .= '-L' . last_line | endif
  call system('open ' . url)
endfunction
]]

vim.cmd [[
noremap <silent> <leader>gN V:<c-u>call OpenNewPrInGithub()<cr>
xnoremap <silent> <leader>gN :<c-u>call OpenNewPrInGithub()<cr>

function! OpenNewPrInGithub()
  let file_dir = expand('%:h')
  let git_remote = system('cd ' . file_dir . '; git remote get-url origin')
  let branch_name = system("git branch --show-current 2> /dev/null | tr -d '\n'")
  let repo_path = matchlist(git_remote, ':\(.*\)\.')[1]

  let url = 'https://github.com/' . repo_path . '/compare' . '/' . branch_name . '\?expand=1'
  call system('open ' . url)
endfunction
]]

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
