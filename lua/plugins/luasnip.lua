return {
  "L3MON4D3/LuaSnip",
  dependencies = { "saadparwaiz1/cmp_luasnip" },
  config = function()
    local ls = require("luasnip")
    local lsl = require("luasnip.loaders")
    local lsll = require("luasnip.loaders.from_lua")
    ls.config.set_config({
        enable_autosnippets = true,
    })

    lsll.lazy_load({ paths = "~/.config/nvim/lua/snippets" })

    vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    vim.keymap.set({ "n" }, '<leader>kn', lsl.edit_snippet_files, { desc = "Edit snippets" })
  end,
}
