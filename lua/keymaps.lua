vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}
local function nmap(key, map)
  keymap('n', key, map, opts)
end

--- Built in ---
nmap('<leader>bn', ':bnext<CR>')
nmap('<leader>bp', ':bprevious<CR>')
nmap('<leader>nh', ':noh<CR>')


nmap('<leader>cp', ':ClangdSwitchSourceHeader')

nmap('<leader>tt', ':ToggleTerm <CR>')
nmap('<leader>ti', ':Trouble diagnostics toggle pinned=true win.relative=win win.position=bottom<CR>')
nmap('<leader>ts', ':Trouble symbols toggle pinned=true win.relative=win win.position=right<CR>')

  -- keys = {
  --   {
  --     "<leader>?",
  --     function()
  --       require("which-key").show({ global = false })
  --     end,
  --     desc = "Buffer Local Keymaps (which-key)",
  --   },
  -- },
