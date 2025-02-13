return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  opts = {
      defauls = {
        file_ignore_patterns = {"build", "node_modules"}
      }
  }
}
