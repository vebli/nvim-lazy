return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        local highlight_groups = {}
        local function set_highlight_groups(config, groups)
            for _, group in ipairs(groups) do
                highlight_groups[group] = config
            end
        end
        set_highlight_groups({ fg = "Text" }, {
            "Attribute",
            "Property",
            "Identifier",
            "Identifier",
            "Special",
            "@variable",
            "@variable.paramter",
            "@variable.builtin",
            "@parameter",
            "@property",
            "@interface",
            "@lsp.type.namespace",
            "Exception",
            "Conditional",
            "Label",
            "Repeat",
        })
        set_highlight_groups({ fg = "Gold" }, {
            "String", "@string",
            "Character", "@character",
        })
        set_highlight_groups({ fg = "#b4637a" }, { "Comment", })
        set_highlight_groups({ fg = "black", bg = "#b4637a", bold = true }, { "Todo", })

        set_highlight_groups({ fg = "Rose" }, {
            "Boolean", "@boolean",
            "Number", "@number",
            "Float",
        })
        set_highlight_groups({ fg = "Pine", bold = true }, {
            "Function", "@function", "@function.builtin", "@function.macro",
            "@function.method", "@lsp.type.method",
            "@constructor",
            "@lsp.type.class", "Structure"
        })
        set_highlight_groups({ fg = "Foam" }, {
            "Statement",
            "Type", "@type", "@type.builtin", 
            "Typedef",
            "Keyword", "@keyword",
        })
        set_highlight_groups({ fg = "Iris", bold = false }, {
            "PreProc",
            "Define",
            "Include", "@keyword.import",
            "Macro",
            "@constant.macro",
            "@lsp.type.macro",
        })
        require 'rose-pine'.setup({
            variant = "main",
            highlight_groups = highlight_groups,
            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                if highlight.undercurl then
                    highlight.undercurl = false
                end
            end,
        })
        vim.cmd("colorscheme rose-pine-main")
    end
}
