return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            outline = {
                auto_preview = false,
                keys = {
                    toggle_or_jump= '<CR>',
                },
            },
            finder = {
                keys = {
                    toggle_or_open = '<CR>',
                },
            },
            symbol_in_winbar = {
                enable = false,
            },
            lightbulb = {
                virtual_text = false,
            },
            code_action = {
                enable = false,
            },
            rename = {
                enable = false,
            },
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
