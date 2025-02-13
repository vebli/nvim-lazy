
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = {
                'texlab',
                'lua_ls',
                'pylsp',
                'gopls',
                'nil_ls',
                'html',
                'biome',
                'cssls',
                'tailwindcss',
                'cmake',
                'docker_compose_language_service',
                'dockerls',
                'rust_analyzer',
                'arduino_language_server',
                'asm_lsp',
                'ols'
            }
            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities,
                }
            end

            -- Configure each language server
            lspconfig.clangd.setup {
                capabilities = capabilities,
                cmd = { 'clangd', '--compile-commands-dir=build'},
                filetypes = { 'c', 'cpp' },
                root_dir = function() return vim.fn.getcwd() end,
                on_attach = function(client, bufnr)
                    -- Set compiler flags
                    vim.api.nvim_buf_set_option(bufnr, 'makeprg', 'clang\\ -Wall\\ -Wextra\\ -O3\\ %')
                    vim.api.nvim_buf_set_option(bufnr, 'errorformat', '%f:%l:%c:\\ %tarning:\\ %m,%f:%l:%c:\\ %trror:\\ %m')
                end,
            }
            lspconfig.sqls.setup {
                capabilities = capabilities,
                root_dir = function() return vim.fn.getcwd() end,
            }
            lspconfig.nixd.setup {
                cmd = {"nixd"},
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import <nixpkgs> { }",
                        },
                        formatting = {
                            command = {"alejandra"},
                        },
                    },
                },
            }
            -- Add more language servers as needed
        end
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Lazy load on entering insert mode
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = { { name = "nvim_lsp" } },
                mapping = cmp.mapping.preset.insert({
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                }),
            })
        end,
    },
}
