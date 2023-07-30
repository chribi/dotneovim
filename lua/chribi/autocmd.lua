local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Delete trailing whitespace on save
local fixws_group = vim.api.nvim_create_augroup('FixWS', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd [[ keeppatterns %s/\v\s+$//e ]]
    vim.api.nvim_win_set_cursor(0, pos)
  end,
  group = fixws_group,
})
