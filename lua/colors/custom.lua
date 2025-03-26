vim.cmd("highlight clear")   -- Clears existing highlights
vim.opt.termguicolors = true -- Ensures true color support
vim.g.colors_name = "custom" -- Registers the colorscheme

local c = {

-- rose-pine colors
    rp_fg = "#e0def4",
    rp_base = "#191724",
    rp_pine = "#3e8fb0",
    rp_rose = "#ebbcba",
    rp_gold = "#f6c177",
    rp_iris = "#c4a7e7",
    rp_subtle = "#908caa",
    rp_love = "#eb6f92",
    rp_love3 = "#b4637a",
    rp_foam = "#9ccfd8",
}

local function set_highlight(opts, groups)
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end
--
set_highlight({ fg = c.rp_fg, bg = c.rp_bg}, { "Normal"})

set_highlight({fg = c.rp_fg},{
    "Repeat",
    "Statement",
    "Attribute",
    "Property",
    "Identifier",
})
set_highlight({ fg = c.rp_gold }, {
    "String", "@string",
    "Character", "@character",
})
set_highlight({fg = c.rp_subtle}, { "Operator", "@operator" })
set_highlight({ fg =  c.rp_love3}, { "Comment", "@comment", })
set_highlight({ fg = "black", bg =  c.rp_love3, bold = true}, {"TODO"})
set_highlight({ fg = c.rp_rose}, {
    "Boolan",
    "Number", "Float",
})
set_highlight({ fg = c.rp_pine, bold = true}, {
    "Function", "@function", "@constructor",
    "@constant",
    "@constant.macro", "@lsp.type.macro",
})

set_highlight({ fg = c.rp_foam }, {
    "Type", "@type", "@type.builtin",
    "Keyword", "@keyword",
})
set_highlight({ fg = c.rp_iris }, {
    "PreProc",
    "Macro",
    "Define",
    "Include",
})
set_highlight({fg = c.rp_love}, {"Error"})
-- set_highlight("Error", { fg = colors.white, bg = colors.red, bold = true })
