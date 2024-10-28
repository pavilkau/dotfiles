-- return {
-- {
--   "ibhagwan/fzf-lua",
--   -- optional for icon support
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     -- calling `setup` is optional for customization
--     require("fzf-lua").setup({})
--
--     vim.keymap.set("n", "<Leader>,", require('fzf-lua').files, { desc = "Fzf Files" })
--     vim.keymap.set("n", "<Leader>r", require('fzf-lua').grep_project, { desc = "Fzf Rg" })
--   end
-- },
-- }
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  keys = {
    { '<leader>,', require('telescope.builtin').find_files },
    { "<leader>r", require('telescope.builtin').live_grep },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false -- Ctrl-U to clear form
          },
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
  end
}
