return {
    {
        'shaunsingh/solarized.nvim',
        priority = 1000,
        config = function()
            vim.g.solarized_borders = true
            vim.opt.background = 'light'
        end,
    },
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = "dawn",
                dark_variant = "moon",
                dim_inactive_windows = true,
                highlight_groups = {
                    -- NormalFloat = { bg = "base" },
                    -- FloatBorder = { bg = "base", fg = "subtle" },
                    -- TelescopeBorder = { link = "FloatBorder" },
                    LspInlayHint = { blend = 10, fg = "muted", bg = "highlight_high", italic = true },
                    Folded = { bg = "highlight_med", italic = true },
                    StatusLine = { bg = "highlight_high" },
                    ColorColumn = { bg = "#ebbcba" },
                    Comment = { fg = "muted" },
                },
            })
            vim.opt.background = 'light'
            vim.cmd.colorscheme 'rose-pine'
        end,
    }
}
