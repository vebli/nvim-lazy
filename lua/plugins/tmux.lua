return {
  "aserowy/tmux.nvim",
  event = "VeryLazy", -- Lazy-load when Neovim is idle
  opts = {
    -- Configuration options for tmux.nvim
    navigation = {
      enable_default_keybindings = true, -- Use default keybindings (Ctrl-h/j/k/l)
      cycle_navigation = false,         -- Prevent cycling to the opposite pane
      persist_zoom = true,              -- Preserve zoom mode in tmux panes
    },
    resize = {
      enable_default_keybindings = true, -- Use default resize bindings (Ctrl-<arrow>)
      resize_step_x = 2,                 -- Horizontal resize step
      resize_step_y = 2,                 -- Vertical resize step
    },
  },
  config = function(_, opts)
    require("tmux").setup(opts)
  end,
}
