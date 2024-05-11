local function config_treesitter()
    ---@diagnostic disable-next-line: missing-fields
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

                    ['a/'] = { query = '@comment.outer', desc = 'Outer comment' },
                },
                selection_modes = {
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "V",
                    ["@comment.outer"] = "V",
                },
            },

            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']]'] = { query = '@function.outer', desc = 'Next [f]unction' },
                    [']c'] = { query = '@class.outer', desc = 'Next class' },
                },
                goto_next_end = {
                    [']['] = { query = '@function.outer', desc = '[f]unction end' },
                    [']C'] = { query = '@class.outer', desc = 'Class end' },
                },
                goto_previous_start = {
                    ['[['] = { query = '@function.outer', desc = 'Previous [f]unction start' },
                    ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
                },
                goto_previous_end = {
                    ['[]'] = { query = '@function.outer', desc = 'Previous [f]unction end' },
                    ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
                },
            },

            swap = {
                enable = true,
                swap_next = {
                    ['<leader>xa'] = '@parameter.inner',
                    ['<leader>xf'] = '@function.outer',
                },
                swap_previous = {
                    ['<leader>xA'] = '@parameter.inner',
                    ['<leader>xF'] = '@function.outer',
                },
            },
        },
    }
end

vim.keymap.set("n", "[k", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

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
        opts = { multiline_threshold = 3 },
    },
}
