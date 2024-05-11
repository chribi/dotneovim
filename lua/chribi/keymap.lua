vim.keymap.set({'n', 'v'}, '<space>', '<nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Join lines without changing cursor pos
vim.keymap.set('n','J', "mzJ`z");

-- indent/outdent in visual mode with </>
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- move selected lines in visual mode with J/K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- clipboard helper
vim.keymap.set('v', '<leader>y', '"*y', { desc = "[Y]ank to clipboard" })
vim.keymap.set({ 'n', 'v' }, '<leader>cy', '<cmd>let @*=@"<cr>', { desc = 'Copy register @" -> @*' })
vim.keymap.set({ 'n', 'v' }, '<leader>cp', '<cmd>let @"=@*<cr>', { desc = 'Copy register @* -> @"' })

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
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = '[D]iagnostic [e]rror' })
vim.keymap.set('n', '<leader>dd', '<cmd>Trouble document_diagnostics<cr>', { desc = '[D]iagnostic error list ([D]ocument)' })
vim.keymap.set('n', '<leader>da', '<cmd>Trouble document_diagnostics<cr>', { desc = '[D]iagnostic error list ([A]ll)' })
vim.keymap.set('n', '<leader>df', function() require('telescope.builtin').diagnostics() end, { desc = '[D]iagnostic [F]ind' })

-- git
vim.keymap.set('n', '<leader>gL', '<cmd>DiffviewFileHistory<cr>', { desc = '[G]it [L]og (Diffview)'})
vim.keymap.set('n', '<leader>gfL', '<cmd>DiffviewFileHistory %<cr>', { desc = '[G]it [F]ile [L]og (Diffview)'})

-- snipsnipsnip
vim.keymap.set('n', '<leader>sne', require('luasnip.loaders').edit_snippet_files, { desc = "edit snippets" })

-- wiki stuff
vim.keymap.set('n', '<leader>fn',
  function() require("chribi.wiki").find_wiki() end,
  { desc = "[F]ind wiki [n]ote" })
