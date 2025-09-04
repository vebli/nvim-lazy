vim.g.colors_name = 'minimal'
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.opt.termguicolors = true
vim.o.background = 'dark';


local function set_highlight(opts, groups)
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

local acc1 = "#4FB8CC"
local acc2 = "#806699"
local acc3 = "#669966"

local grey90 = "#f2f2f2"
local grey80 = "#CCCCCC"
local grey70 = "#b3b3b3"
local grey60 = "#999999"
local grey50 = "#808080"
local grey40 = "#666666"
local grey30 = "#4D4D4D"

local yellow = "#e8e87d"
local red = "#b30000"


local bg_dark = "#1a1825"
local bg_light = "NvimLightGrey1"
local text = grey80
local functions = grey90
local types = grey50
local operators = types
local macros = grey60

local strings = acc1
local numbers = acc1
local comments = acc3


-- Remove annoying underlines
set_highlight({ underline = false, undercurl = false }, {
    "DiagnosticUnderlineInfo"
})

-- UI
set_highlight({ fg = text, bg = bg_dark }, {
    "Normal",
    "Pmenu",
    "NormalFloat",
})

-- Regular Text
set_highlight({ fg = text }, {
    "Attribute",
    "Property",
    "Identifier",
    "DiagnosticUnnecessary",
})

-- Accents
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
