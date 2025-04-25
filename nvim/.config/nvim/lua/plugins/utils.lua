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
        go = {'golangci-lint', 'gofmt'},
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
  },
  {
    -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup {
        sections = {
          lualine_a = {'mode'},
          lualine_b = {
            { 'filename', path = 1 }
          },
          lualine_c = { 'diff' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        }
      }
    end
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup()

      vim.keymap.set("n", "<Leader>-", "<cmd>Oil<CR>")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = { "comment" },
      ignore_install = { "tex", "latex" },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>M", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    end
  }
}
