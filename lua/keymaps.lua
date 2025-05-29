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

vim.keymap.set('n', 'gs', '<Nop>') -- Freezes nvim (intentionally)

--- Built-in ---
nmap('<leader>bn', ':bnext<CR>')
nmap('<leader>bp', ':bprevious<CR>')
nmap('<leader>nh', ':noh<CR>')

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

--- Telescope ---
nmap('<leader>ff', ':Telescope find_files<CR>')
nmap('<leader>fg', ':Telescope git_files<CR>')
nmap('<leader>bm', ':Telescope buffers<CR>')
nmap('<leader>qf', ':Telescope quickfix<CR>')



--- LSP ---
nmap('<leader>fc', ':ClangdSwitchSourceHeader')
nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap("<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>")
nmap("<leader>tv", toggle_virtual_text)

--- Lspsaga
-- nmap("<leader>ld", ":Lspsaga show_buf_diagnostics ++normal<CR>")
nmap("<leader>lr", ":Lspsaga finder<CR>")
nmap("<leader>la", ":Lspsaga code_action<CR>")
nmap("<leader>lfo", ":Lspsaga outgoing_calls<CR>")
nmap("<leader>lfi", ":Lspsaga incoming_calls<CR>")
nmap("<leader>ls", ":Lspsaga outline<CR>")


--- DB ---
nmap('<leader>dad', ':DBUIToggle<CR>')

-- Oil
nmap('-', '<CMD>Oil<CR>')

-- Trouble
nmap('<leader>tt', ':Trouble diagnostics toggle pinned=true win.relative=win win.position=bottom<CR><CR>')
-- nmap('<leader>ts', ':Trouble symbols toggle pinned=true win.relative=win win.position=right win.size=0.25<CR>')
