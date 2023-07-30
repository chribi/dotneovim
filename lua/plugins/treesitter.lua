local function config_treesitter()
    require'nvim-treesitter.configs'.setup {
        highlight = { enable = true, },
        indent = { enable = true, },
        playground = { enable = true, },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<CR>',
                node_incremental = '<CR>',
                scope_incremental = false,
                node_decremental = '<BS>',
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['aa'] = { query = '@parameter.outer', desc = 'Outer [a]rgument' },
                    ['ia'] = { query = '@parameter.inner', desc = 'Inner [a]rgument' },
                    ['af'] = { query = '@function.outer', desc = 'Outer [f]unction' },
                    ['if'] = { query = '@function.inner', desc = 'Inner [f]unction' },
                    ['ac'] = { query = '@class.outer', desc = 'Outer [c]lass' },
                    ['ic'] = { query = '@class.inner', desc = 'Inner [c]lass' },
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']m'] = { query = '@function.outer', desc = 'Next [m]ethod' },
                    [']]'] = { query = '@class.outer', desc = 'Next class' },
                },
                goto_next_end = {
                    [']M'] = { query = '@function.outer', desc = '[m]ethod end' },
                    [']['] = { query = '@class.outer', desc = 'Class end' },
                },
                goto_previous_start = {
                    ['[m'] = { query = '@function.outer', desc = 'Previous [m]ethod start' },
                    ['[['] = { query = '@class.outer', desc = 'Previous class start' },
                },
                goto_previous_end = {
                    ['[M'] = { query = '@function.outer', desc = 'Previous [m]ethod end' },
                    ['[]'] = { query = '@class.outer', desc = 'Previous class end' },
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>A'] = '@parameter.inner',
                },
            },
        },
    }
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/playground',
        },
        build = ':TSUpdate',
        config = config_treesitter,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { },
    },
}
