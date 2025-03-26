return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",                   -- Automatically run :TSUpdate after installation
    event = { "BufReadPost", "BufNewFile" }, -- Lazy-load on file open
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = "all",
            highlight = {
                enable = false,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
