return {
  "nvim-lualine/lualine.nvim",
  dependencies = {},
  event = "VeryLazy",
  opts = {
      options = {icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
          statusline = {},
          winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
      }
    }
  }
}
