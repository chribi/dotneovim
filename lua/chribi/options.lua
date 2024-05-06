vim.o.mouse = 'a'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true

vim.o.number = true
vim.o.undofile = true

vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true
vim.keymap.set('n', '<leader>or', '<cmd>set invrelativenumber<cr>',
    { desc = 'Toggle [r]elativenumber', silent = true })

vim.wo.linebreak = true
vim.keymap.set('n', '<leader>ol', '<cmd>set invlinebreak<cr>',
    { desc = 'Toggle [l]inebreak', silent = true })

vim.o.colorcolumn = '131'
vim.keymap.set('n', '<leader>oc', function()
    if vim.o.colorcolumn == '' then
        vim.o.colorcolumn = '131'
    else
        vim.o.colorcolumn = ''
    end
end, { desc = 'Toggle [c]olorcolumn', silent = true })

vim.o.scrolloff = 3

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.fileformats = 'unix,dos'
if vim.fn.has('win32') then
    vim.opt.shell = 'cmd'
    -- vim.opt.shell = 'bash'
    -- vim.opt.shellcmdflag = '-c'
    -- vim.opt.shellxquote = '""'
    -- vim.opt.shellslash = true
end
vim.o.title = true

vim.opt.listchars = {
    tab = '>·',
    trail = '·',
}

vim.o.list = true

vim.o.cursorline = true
vim.o.breakindent = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.guifont = 'CaskaydiaCove Nerd Font Mono:h9'
