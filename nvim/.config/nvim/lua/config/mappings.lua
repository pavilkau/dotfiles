local k = vim.keymap

vim.g.mapleader = " "

-- Close window
k.set("n", "<C-q>", ":q<CR>")

-- Search in file
k.set("n", "<Leader>s", ":s//g<Left><Left>")
k.set("n", "<Leader><S-s>", ":%s//gc<Left><Left><Left>")
k.set("n", "<Leader>/", ":nohlsearch<CR>")

-- Simplify splits navigation
k.set("n", "<C-h>", "<C-w>h")
k.set("n", "<C-j>", "<C-w>j")
k.set("n", "<C-k>", "<C-w>k")
k.set("n", "<C-l>", "<C-w>l")

-- Format file
k.set("n", "<Leader>=", "mpgg=G'p")

-- Switch 0 to jump to the first char
k.set("n", "0", "^")
k.set("n", "^", "0")

-- New blank split
k.set("n", "<Leader>v", ":vnew<CR>")

-- Surround binds
-- <leader># Surround a word with #{ruby interpolation}
k.set("n", "<Leader>#", "ciw#{<C-R>\"}<ESC>")
k.set("v", "<Leader>#", "c#{<C-R>\"}<ESC>")
-- <leader>' Surround a word with 'quotes'
k.set("n", "<Leader>\"", [[ciw"<C-R>""<ESC>]])
k.set("v", "<Leader>\"", [[c"<C-R>""<ESC>]])
-- <leader>' Surround a word with 'single quotes'
k.set("n", "<Leader>'", "ciw'<C-R>\"'")
k.set("v", "<Leader>'", "c'<C-R>\"'<ESC>")
-- <leader>) Surround a word with (parens)
k.set("n", "<Leader>(", "ciw(<C-R>\")<ESC>")
k.set("n", "<Leader>)", "ciw(<C-R>\")<ESC>")
k.set("v", "<Leader>(", "c( <C-R>\" )<ESC>")
k.set("v", "<Leader>)", "c(<C-R>\")<ESC>")
-- <leader>[ Surround a word with [brackets]
k.set("n", "<Leader>]", "ciw[<C-R>\"]<ESC>")
k.set("n", "<Leader>[", "ciw[<C-R>\"]<ESC>")
k.set("v", "<Leader>]", "c[ <C-R>\" ]<ESC>")
k.set("v", "<Leader>[", "c[<C-R>\"]<ESC>")
-- <leader>{ Surround a word with {braces}
k.set("n", "<Leader>}", "ciw{<C-R>\"}<ESC>")
k.set("n", "<Leader>{", "ciw{<C-R>\"}<ESC>")
k.set("v", "<Leader>}", "c{ <C-R>\" }<ESC>")
k.set("v", "<Leader>{", "c{<C-R>\"}<ESC>")

-- yank file path
k.set("n", "<Leader>cf", [[:let@+=expand("%")<CR>]], { silent = true })
