return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    opts = {
        ui = {
            border = "rounded",
        },
        settings = {
            enableSnippets = "true",
        },
        widget_guides = {
            enabled = true,
        }
    },
    config = function(_, opts)
        require("flutter-tools").setup(opts)
    end,
}
