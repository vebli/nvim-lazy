require("lazy").setup({
    root = nil,
    -- install = { missing = false, },
    defaults = { version = "*" },
    spec = {
        -- { import = "plugins.minimal" },
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

vim.cmd("highlight clear")
vim.opt.termguicolors = true


local function set_highlight(opts, groups)
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

acc1 = "#4FB8CC"
acc2 = "#806699"
acc3 = "#669966"

grey90 = "#f2f2f2"
grey80 = "#CCCCCC"
grey70 = "#b3b3b3"
grey60 = "#999999"
grey50 = "#808080"
grey30 = "#666666"
grey30 = "#4D4D4D"

local yellow = "#e8e87d"
local red = "#b30000"


local text = grey80
local functions = grey90
local types = grey60
local operators = grey80
local macros = grey60

local strings = acc1
local numbers = acc1
local comments = acc3


set_highlight({ fg = text }, { "Normal" })

set_highlight({ fg = text }, {
    "Attribute",
    "Property",
    "Identifier",
    "DiagnosticUnnecessary"
})

-- ACCENTS
set_highlight({ fg = acc2 }, { "Special" })
set_highlight({ fg = functions, bold = false }, {
    "Function", "@function", "@constructor",
    "@constant",
    "@constant.macro", "@lsp.type.macro",
})


set_highlight({ fg = strings }, {
    "String", "@string",
    "Character", "@character",
})
set_highlight({ fg = numbers }, {
    "Boolan",
    "Number", "Float",
})
set_highlight({ fg = types }, {
    "Type", "@type", "@type.builtin",
    "Keyword", "@keyword",
    "Repeat",
    "Statement",
})
set_highlight({ fg = operators }, { "Operator", "@operator" })
set_highlight({ fg = comments }, { "Comment", "@comment", })
set_highlight({ fg = "black", bg = comments, bold = true }, { "TODO" })
--
set_highlight({ fg = macros }, {
    "PreProc",
    "Macro",
    "Define",
    "Include",
})
-- VIRTUAL TEXT
set_highlight({ fg = "#6b2e2e" }, {
    "DiagnosticError",
})
set_highlight({ fg = "#ac8853" }, {
    "DiagnosticWarn",
})
set_highlight({ fg = "#6c6c93" }, {
    "DiagnosticHint",
    "DiagnosticInfo",
})
set_highlight({ fg = types }, {
    "LspSignatureActiveParameter",
})

-- RAINBOW DELIMITERS
set_highlight({ fg = grey90 }, { "RainbowDelimiterRed" })
set_highlight({ fg = grey70 }, { "RainbowDelimiterOrange" })
set_highlight({ fg = grey50 }, { "RainbowDelimiterYellow" })
set_highlight({ fg = grey40 }, { "RainbowDelimiterGreen" })
set_highlight({ fg = grey90 }, { "RainbowDelimiterCyan" })
set_highlight({ fg = grey70 }, { "RainbowDelimiterBlue" })
set_highlight({ fg = grey40 }, { "RainbowDelimiterViolet" })
