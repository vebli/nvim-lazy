require("lazy").setup({
    root = nil;
    install = { missing = false, }, 
    defaults = { version = "*" },
    spec = {
        { import = "plugins.telescope" },  
        { import = "plugins.web-devicons" },  
        { import = "plugins.lualine" },  
        { import = "plugins.vimtex" },  
        { import = "plugins.treesitter" },  
        { import = "plugins.dashboard" },  
        { import = "plugins.oil" },  
        { import = "plugins.tmux" },  
        { import = "plugins.autopairs" },  
        { import = "plugins.lsp" },  
        { import = "plugins.mason" },  
        { import = "plugins.overseer" },  
        { import = "plugins.otter" },  
        { import = "plugins.highlight-color" },  
        { import = "plugins.trouble" },  
        { import = "plugins.toggle-term" },
        { import = "plugins.godbolt" },
        { import = "plugins.signature" },
        { import = "plugins.which-key" },
    }

})
