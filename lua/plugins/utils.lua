local highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
}

return {
    -- Auto detect tabstop/shiftwidth
    'tpope/vim-sleuth',

    'vim-scripts/camelcasemotion',

    { 'numToStr/Comment.nvim', opts = {} },

    -- keymap hints
    {
        'folke/which-key.nvim',
        opts = {
            defaults = {
                ['<leader>f'] = { name = "+find" },
                ['<leader>d'] = { name = "+diagnostics" },
                ['<leader>g'] = { name = "+git" },
                ['<leader>h'] = { name = "+harpoon" },
                ['<leader>n'] = { name = "+neotree" },
                ['<leader>o'] = { name = "+options" },
                ['<leader>w'] = { name = "+LSP wordspace" },
            },
        },
        config = function(_, opts)
            require('which-key').setup(opts)
            require('which-key').register(opts.defaults)
        end,
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = "┊",
                highlight = highlight,
            },
            scope = { enabled = false },
        },
        dependencies = { 'hiphish/rainbow-delimiters.nvim'},
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
                highlight = highlight,
            }
        end,
    },
}
