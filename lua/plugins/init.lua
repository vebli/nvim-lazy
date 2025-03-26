require("lazy").setup({
    root = nil,
    -- install = { missing = false, },
    defaults = { version = "*" },
    spec = {
        { import = "plugins.rose-pine" },
        { import = "plugins.telescope" },
        { import = "plugins.web-devicons" },
        { import = "plugins.lualine" },
        { import = "plugins.luasnip" },
        { import = "plugins.vimtex" },
        { import = "plugins.treesitter" },
        { import = "plugins.alpha" },
        { import = "plugins.oil" },
        { import = "plugins.tmux" },
        { import = "plugins.autopairs" },
        { import = "plugins.lsp" },
        { import = "plugins.otter" },
        { import = "plugins.highlight-color" },
        { import = "plugins.trouble" },
        { import = "plugins.godbolt" },
        { import = "plugins.signature" },
        { import = "plugins.surround" },
        { import = "plugins.dadbod" },
        { import = "plugins.rainbow-delimiters" }
    }

})
