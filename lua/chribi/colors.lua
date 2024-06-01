local colors = require('solarized.colors')

local function adjust_colors_solarized()
    vim.api.nvim_set_hl(0, 'qfLineNr', { fg = 'fg', italic = true })
    vim.api.nvim_set_hl(0, 'Pmenu', { link = 'NormalFloat' })
    vim.api.nvim_set_hl(0, 'Search', { ctermfg = 0, ctermbg = 225, fg = colors.white, bg = colors.fg_light })
    vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.white, bg = colors.blue })
    vim.api.nvim_set_hl(0, 'QuickFixLine', { link = 'Search' })
    vim.api.nvim_set_hl(0, 'NonText', { fg = colors.magenta })

    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = "none", fg = colors.red })
    vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = "none", fg = colors.red })
    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#CDD998' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#FFE8BE' })

    vim.api.nvim_set_hl(0, 'Folded', { bg = '#B6D3DE', italic = true })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#3dcddb' })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { link = 'DiagnosticHint' })
    vim.api.nvim_set_hl(0, 'LspInlayHint', { italic = true, fg = '#aaaaaa' })
end

-- adjust_colors_solarized()

local colors_group = vim.api.nvim_create_augroup('AdjustColors', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'solarized',
    group = colors_group,
    callback = adjust_colors_solarized,
})
