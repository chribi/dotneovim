local colors = require('solarized.colors')

local function adjust_colors()
    vim.api.nvim_set_hl(0, 'qfLineNr', { fg = 'fg', italic = true })
    vim.api.nvim_set_hl(0, 'Pmenu', { link = 'NormalFloat' })
    vim.api.nvim_set_hl(0, 'Search', { ctermfg = 0, ctermbg = 225, fg = colors.white, bg = colors.fg_light })
    vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.white, bg = colors.blue })
    vim.api.nvim_set_hl(0, 'QuickFixLine', { link = 'Search' })
    vim.api.nvim_set_hl(0, 'NonText', { fg = colors.magenta })
end

adjust_colors()

local colors_group = vim.api.nvim_create_augroup('AdjustColors', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = colors_group,
    callback = adjust_colors,
})
