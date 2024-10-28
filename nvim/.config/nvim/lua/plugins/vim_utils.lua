return {
  {
    -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup {
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'filename'},
          lualine_c = {},
          lualine_x = {'branch', 'diff', 'diagnostics'},
          lualine_y = {},
          lualine_z = {'location'}
        }
      }
    end
  }
}
