return {
    -- Auto detect tabstop/shiftwidth
    'tpope/vim-sleuth',

    'vim-scripts/camelcasemotion',

    { 'numToStr/Comment.nvim', opts = {} },

    -- keymap hints
    {
        'folke/which-key.nvim',
        opts = { },
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_first_indent_level = false,
            show_trailing_blankline_indent = false,

        }
    },

    {
        'kylechui/nvim-surround',
        opts = { },
    },

    {
        'hiphish/rainbow-delimiters.nvim',
        config = function ()
            local rainbow_delimiters = require('rainbow-delimiters')
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                }
            }
        end,
    },
}
