return {
    "ray-x/lsp_signature.nvim",
    event = { "BufReadPre", "BufNewFile", },
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    },
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
}
