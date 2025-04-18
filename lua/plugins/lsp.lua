return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = {
                'texlab',
                'lua_ls',
                'pyright',
                'gopls',
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
                'ols',
                'matlab_ls',
                'bashls',
                'java_language_server',
                'vuels',
                'wasm_language_tools',
                'glsl_analyzer',
            }
            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities,
                }
            end

            -- Configure each language server
            lspconfig.clangd.setup {
                capabilities = capabilities,
                cmd = { 'clangd', '--compile-commands-dir=build' },
                filetypes = { 'c', 'cpp' },
                root_dir = function() return vim.fn.getcwd() end,
                on_attach = function(client, bufnr)
                    -- Set compiler flags
                    vim.api.nvim_buf_set_option(bufnr, 'makeprg', 'clang\\ -Wall\\ -Wextra\\ -O3\\ %')
                    vim.api.nvim_buf_set_option(bufnr, 'errorformat',
                        '%f:%l:%c:\\ %tarning:\\ %m,%f:%l:%c:\\ %trror:\\ %m')
                end,
            }
            lspconfig.sqls.setup {
                capabilities = capabilities,
                root_dir = function() return vim.fn.getcwd() end,
            }
            lspconfig.nixd.setup {
                cmd = { "nixd" },
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import <nixpkgs> { }",
                        },
                        formatting = {
                            command = { "alejandra" },
                        },
                    },
                },
            }
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim",
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            local lspkind = require('lspkind')
            local cmp = require("cmp")
            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol', -- show only symbol annotations
                        maxwidth = {
                            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                            -- can also be a function to dynamically calculate max width such as
                            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                            menu = 50,            -- leading text (labelDetails)
                            abbr = 50,            -- actual suggestion item
                        },
                        ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function(entry, vim_item)
                            -- ...
                            return vim_item
                        end
                    })
                },
                snippet    = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window     = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                sources    = cmp.config.sources({
                    { name = 'path' },
                    { name = 'latex_symbols' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'vim-dadbod-completion' },
                }, {
                    { name = 'buffer' },
                }),

                mapping    = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile", },
        config = function()
            local lint = require 'lint'
            lint.linters_by_ft = {
                sh = { 'shellcheck' },
                cpp = { 'clangtidy' },
                c = { 'clangtidy' },
                nix = { 'nix' }
            }
            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true, })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end
            })
        end,
    }
}
