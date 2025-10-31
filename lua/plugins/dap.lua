-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installationreturn 
return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            dap.adapters = {
                gdb = {
                    type = "executable",
                    command = "gdb",
                    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
                }
            }
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    args = {}, 
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
                {
                    name = "Select and attach to process",
                    type = "gdb",
                    request = "attach",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    pid = function()
                        local name = vim.fn.input('Executable name (filter): ')
                        return require("dap.utils").pick_process({ filter = name })
                    end,
                    cwd = '${workspaceFolder}'
                },
            }
            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup("python3")
        end
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        config = function ()
            require("nvim-dap-virtual-text").setup{
                enabled = true,                        -- enable this plugin (the default)
                enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true,               -- show stop reason when stopped for exceptions
                commented = false,                     -- prefix virtual text with comment string
                only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
                all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
                clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
                virt_text_pos = 'eol'               -- 'eol or inline'
            }
        end
    }
}
