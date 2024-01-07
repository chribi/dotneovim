vim.keymap.set({'n', 'v'}, '<space>', '<nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>vp', '`[v`]', { desc = '[v]isual select last [p]aste' })

-- buffers
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous [B]uffer', silent = true })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next [B]uffer', silent = true })
vim.keymap.set('n', '<leader>qq', '<cmd>b#|bd#<cr>', { desc = 'Close buffer w/o closing window', silent = true })

-- lists
vim.keymap.set('n', '[q', '<cmd>cprevious<cr>', { desc = 'Previous [q]uickfix', silent = true })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Next [q]uickfix', silent = true })
vim.keymap.set('n', '[l', '<cmd>cprevious<cr>', { desc = 'Previous [l]ocation', silent = true })
vim.keymap.set('n', ']l', '<cmd>cnext<cr>', { desc = 'Next [l]ocation', silent = true })

-- diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous [D]iagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [D]iagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Float diagnostic [e]rror' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = '[D]iagnostic [L]ist' })
vim.keymap.set('n', '<leader>df', function() require('telescope.builtin').diagnostics() end, { desc = '[D]iagnostic [F]ind' })

-- snipsnipsnip
vim.keymap.set('n', '<leader>sne', require('luasnip.loaders').edit_snippet_files, { desc = "edit snippets" })
