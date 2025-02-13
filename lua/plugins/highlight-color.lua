return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-highlight-colors").setup({
      render = "background", -- Options: 'background', 'foreground', 'virtual'
      enable_tailwind = true, -- Enable Tailwind CSS color highlighting
      enable_named_colors = true, -- Highlight named colors like 'red', 'blue', etc.
      enable_hex = true, -- Highlight hex color codes (e.g., #RRGGBB)
      enable_rgb = true, -- Highlight RGB colors (e.g., rgb(255, 0, 0))
      enable_hsl = true, -- Highlight HSL colors (e.g., hsl(120, 100%, 50%))
      exclude_filetypes = { "TelescopePrompt", "NvimTree" }, -- Exclude specific filetypes
    })
  end,
}
