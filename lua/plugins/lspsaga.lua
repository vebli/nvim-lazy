return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = {
                enable = false,
            },
            finder = {
                keys = {
                    toggle_or_open = '<CR>',
                },
            },
            lightbulb = {
                virtual_text = false,
            },

        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
