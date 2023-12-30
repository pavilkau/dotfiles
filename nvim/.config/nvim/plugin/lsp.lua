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
