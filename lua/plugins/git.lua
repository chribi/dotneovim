return {
    {
        {
            'tpope/vim-fugitive',
            init = function()
                vim.keymap.set('n', '<leader>gg', '<cmd>Git<cr>', { desc = '[G]it status', silent = true })
            end,
        },
        'sindrets/diffview.nvim',
        {
            'lewis6991/gitsigns.nvim',
            opts = {
                numhl = true,
                on_attach = function(bufnr)
                    local function nmap(lhs, gitsignsfn, desc)
                        vim.keymap.set('n', lhs, function() require('gitsigns')[gitsignsfn]() end, { buffer = bufnr, desc = desc })
                    end
                    nmap('[g', 'prev_hunk', 'Previous Git Hunk')
                    nmap(']g', 'next_hunk', 'Previous Git Hunk')
                    nmap('<leader>gs', 'stage_hunk', '[G]it [S]tage hunk')
                    nmap('<leader>gv', 'preview_hunk', '[G]it [V]iew hunk')
                    nmap('<leader>gd', 'toggle_deleted', '[G]it show [D]eleted (toggle)')
                    nmap('<leader>gu', 'reset_hunk', '[G]it [U]ndo (reset hunk)')
                end,
            },
        },
    },
}
