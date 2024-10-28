return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        variant = "moon",
        highlight_groups = {
          SignColumn = { fg = "muted", bg = "surface" },
          FoldColumn = { fg = "muted", bg = "surface" },
          LineNr = { fg = "muted", bg = "surface" },
          CursorLineNr = { fg = "yellow", bg = "surface" },
          CursorLineFold = { bg = "surface" },
        }
      }
      -- vim.cmd.colorscheme("rose-pine")
    end
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
      vim.cmd("colorscheme kanagawa")
    end
  },
}
