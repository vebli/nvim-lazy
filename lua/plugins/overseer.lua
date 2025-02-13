return {
  'stevearc/overseer.nvim',
  dependencies = {"nvim-lualine/lualine.nvim"},
  opts = {},
  config = {
      require("overseer").setup({
          strategy = "toggleterm"
      })
  }
}
