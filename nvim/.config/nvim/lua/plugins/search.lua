-- local builtin = require('telescope.builtin')

return {
  {
    -- Using grep function, telescope's one is bad
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
      vim.keymap.set("n", "<Leader>r", [[<cmd>lua require('fzf-lua').grep({ search = "" })<CR>]], { desc = "Fzf Rg" })
      vim.keymap.set("n", "<Leader>,", require('fzf-lua').files, { desc = "Fzf files" })
    end
  }
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     {
  --       'nvim-telescope/telescope-fzf-native.nvim',
  --       build = 'make',
  --     },
  --   },
  --   config = function()
  --     require('telescope').setup {
  --       defaults = {
  --         mappings = {
  --           i = {
  --             ["<C-u>"] = false -- Ctrl-U to clear form
  --           },
  --         },
  --       },
  --
  --       extensions = {
  --         fzf = {
  --           fuzzy = true,                   -- false will only do exact matching
  --           override_generic_sorter = true, -- override the generic sorter
  --           override_file_sorter = true,    -- override the file sorter
  --           case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
  --           -- the default case_mode is "smart_case"
  --         }
  --       }
  --     }
  --     require('telescope').load_extension('fzf')
  --
  --     -- vim.keymap.set("n", "<leader>," , builtin.find_files)
  --   end
  -- }
}
