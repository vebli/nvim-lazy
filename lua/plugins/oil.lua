return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
  cmd = "Oil", -- Lazy-load when the :Oil command is used
  opts = {
    -- Oil-specific configurations
    columns = { "icon" }, -- Show icons in the file explorer
    view_options = {
      show_hidden = true, -- Show hidden files
    },
    keymaps = {
      ["q"] = "actions.close", -- Close Oil with `q`
      ["<CR>"] = "actions.select", -- Open file/directory with Enter
      ["<C-p>"] = "actions.preview", -- Preview file
      ["<C-r>"] = "actions.refresh", -- Refresh the view
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}
