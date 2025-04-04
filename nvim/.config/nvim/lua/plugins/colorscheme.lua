return {
  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({
        colorset = "mountain"

      })
      -- vim.cmd("colorscheme mellifluous")
    end
  },
  {
    'AlessandroYorba/Alduin',
    config = function()
      -- vim.cmd("colorscheme alduin")
    end
  },
  {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme darkrose")
    end
  },
  {
    'morhetz/gruvbox',
    config = function()
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_contrast_light = 'soft'
      -- vim.o.background='light'
      -- vim.cmd("colorscheme gruvbox")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end
  }
}
