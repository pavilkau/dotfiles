return {
  {
    "williamboman/mason.nvim", -- manage LSP servers, DAP servers, linters, and formatters through a single interface
    lazy = false,
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim", -- install LSP servers
    lazy = false,
    opts = {
      automatic_installation = true,
      ensure_installed = { "lua_ls", "ruby_lsp" },
    },
  },
  {
    "neovim/nvim-lspconfig", -- configure LSP servers
    lazy = false,
    config = function()
      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        vim.lsp.inlay_hint.enable()

        -- opts.desc = "Show documentation for what is under cursor"
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- opts.desc = "Show line diagnostics"
        -- vim.keymap.set("n", "<C-W>d", vim.diagnostic.open_float, opts)

        -- opts.desc = "Go to previous diagnostic"
        -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        -- opts.desc = "Go to next diagnostic"
        -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Go to definition"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Show all references"
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        opts.desc = "Show available code actions"
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Format source code"
        vim.keymap.set("n", "<Leader>F", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup{}
      lspconfig.solargraph.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = {
          ['textDocument/publishDiagnostics'] = function(...) end
        },
      })
    end,
  },
}
