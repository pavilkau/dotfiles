return {
  {
    -- comments with keybind gc/gcc
    "tomtom/tcomment_vim"
  },
  {
    -- Toggle terminal
    'kassio/neoterm',
    config = function()
      vim.g.neoterm_default_mod = 'rightbelow vertical'

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Go to normal mode in term" })
      vim.keymap.set("n", "<Leader><Esc>", "<cmd>Ttoggle<CR><C-w>l", { desc = "Toggle term", silent = true })
    end
  },
  {
    -- Tests with keybinds
    "vim-test/vim-test",
    keys = {
      { "<leader>tl", "<cmd>TestNearest<cr>", desc = "Test block" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test File" },
      { "<leader>ta", "<cmd>TestSuite <cr>", desc = "Test all" },
    },
    config = function()
      vim.g['test#strategy'] = 'neoterm'
    end
  },
  {
    -- Toggle between main and test file
    'bodymindarts/vim-twitch',
    keys = {
      { "<C-s>", "<cmd> Twitch<CR>", { silent = true } }
    }
  },
  {
    'tpope/vim-fugitive',
    keys = {
      { "<leader>gb", "<cmd>Git blame<CR>" }
      -- { "<leader>gh", "<cmd>diffget //2<CR>" },
      -- { "<leader>gl", "<cmd>diffget //3<CR>" },
    }
  },
  {
    'dense-analysis/ale',
    config = function()
      local g = vim.g

      g.ale_linters = {}
      g.ale_ruby_rubocop_executable = 'bundle'
      g.ale_linters_explicit = 1
      g.ale_sign_column_always = 1
      g.ale_lint_on_save = 1

      g.ale_linters = {
        ruby = {'rubocop', 'ruby'},
        go = {'gopls'},
      }
    end
  },
  {
    'airblade/vim-gitgutter'
  },
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set("i", "<C-c>", [[<Plug>(copilot-dismiss)<C-C>]], { desc = "Dismiss copilot when exiting insert" })
    end
  }
}
