return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'rose-pine-high-contrast',
            },
            sections = {
                lualine_b = {
                    'branch',
                    { 'diff',
                        -- diff_color = {
                        --     added = { fg = require('solarized.colors').green },
                        --     modified = { fg = require('solarized.colors').blue },
                        --     removed = { fg = require('solarized.colors').red },
                        -- },
                        source = function()
                            local gs = vim.b['gitsigns_status_dict']
                            if gs then
                                return {
                                    added = gs.added,
                                    modified = gs.changed,
                                    removed = gs.removed,
                                }
                            end
                        end,
                    },
                    'diagnostics',
                },
                lualine_c = {
                    { 'filename', path = 1 }
                }
            },
            extensions = { 'quickfix', 'fugitive', 'neo-tree' },
        }
    },
}
