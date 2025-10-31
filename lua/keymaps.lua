vim.g.mapleader = " "
local opts = { noremap = true }
local function nmap(key, map, desc)
    if desc then
        opts.desc = desc
    end
    vim.keymap.set('n', key, map, opts)
end

local function toggle_virtual_text()
    if vim.diagnostic.config().virtual_text == true then
        vim.diagnostic.config({ virtual_text = false })
    else
        vim.diagnostic.config({ virtual_text = true })
    end
end

local function toggle_quick_fix_list()
  local is_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      is_open = true
      break
    end
  end
  if is_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

vim.keymap.set('n', 'gs', '<Nop>') -- Freezes nvim (intentionally)

--- Built-in ---

-- buffers
nmap('<leader>bn', ':bnext<CR>')
nmap('<leader>bp', ':bprevious<CR>')
nmap('<leader>nh', ':noh<CR>')

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- LSP 
nmap('<leader>fc', ':ClangdSwitchSourceHeader<CR>')
nmap('gd', vim.lsp.buf.definition)
nmap('<leader>rn', vim.lsp.buf.rename)
nmap('K', function() vim.lsp.buf.hover({border = 'rounded'}) end)
nmap("<leader>lf", vim.lsp.buf.format)
nmap("<leader>ln", vim.diagnostic.goto_next)
nmap("<leader>lp", vim.diagnostic.goto_prev)
nmap("<leader>tv", toggle_virtual_text)
nmap("<leader>la", vim.lsp.buf.code_action)

-- DAP
nmap("<leader>dc", ':DapContinue<CR>')
nmap("<leader>ds", ':DapStepOver<CR>')
nmap("<leader>di", ':DapStepInto<CR>')
nmap("<leader>do", ':DapStepOut<CR>')
nmap("<leader>db", ':DapToggleBreakpoint<CR>')
nmap("<leader>dt", ':DapToggleRepl<CR>')

-- quickfix
nmap("<leader>cn", ":cnext<CR>")
nmap("<leader>cp", ":cprev<CR>")
nmap("<leader>cc", toggle_quick_fix_list)
vim.keymap.set("n", "lr", function() -- vim.lsp.buf.references but without stealing focus
	local win = vim.api.nvim_get_current_win()
	vim.lsp.buf.references(nil, {
		on_list = function(items, title, context)
			vim.fn.setqflist({}, " ", items)
			vim.cmd.copen()
			vim.api.nvim_set_current_win(win)
		end,
	})
end)

-- Telescope 
nmap('<leader>ff', ':Telescope find_files<CR>')
nmap('<leader>fg', ':Telescope git_files<CR>')
nmap('<leader>fl', ':Telescope live_grep<CR>')
nmap('<leader>f?', ':Telescope help_tags<CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')


-- Lspsaga 
nmap("<leader>lfo", ":Lspsaga outgoing_calls<CR>")
nmap("<leader>lfi", ":Lspsaga incoming_calls<CR>")
nmap("<leader>ls", ":Lspsaga outline<CR>")


-- DB 
nmap('<leader>dad', ':DBUIToggle<CR>')

-- Oil
nmap('-', '<CMD>Oil<CR>')

-- Trouble
nmap('<leader>tt', ':Trouble diagnostics toggle pinned=true win.relative=win win.position=bottom<CR><CR>')
-- nmap('<leader>ts', ':Trouble symbols toggle pinned=true win.relative=win win.position=right win.size=0.25<CR>')
