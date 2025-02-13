return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Lazy load on entering insert mode
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Enable Treesitter integration
        disable_filetype = { "TelescopePrompt","el" }, -- Disable for specific filetypes
      })

      -- Optional: Integration with nvim-cmp (completion plugin)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
}
