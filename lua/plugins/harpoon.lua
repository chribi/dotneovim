return {
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { global_settings = { enter_on_sendcmd = true } },
        lazy = true,
        init = function()
            vim.keymap.set('n', '<leader>hf', function() require('harpoon.ui').toggle_quick_menu() end,
                { desc = '[H]arpoon [F]iles' })
            vim.keymap.set('n', '<leader>ha', function() require('harpoon.mark').add_file() end,
                { desc = '[H]arpoon [A]dd file' })
            vim.keymap.set('n', '<leader>ht', function() require('harpoon.cmd-ui').toggle_quick_menu() end,
                { desc = '[H]arpoon [T]erminal commands' })
            vim.keymap.set('n', '[t', function() require('harpoon.term').gotoTerminal(1) end,
                { desc = 'Harpoon [T]erminal' })
            for i=1,5 do
                vim.keymap.set('n', '[' .. i, function() require('harpoon.ui').nav_file(i) end,
                    { desc = 'Harpoon file [' .. i .. ']' })
                vim.keymap.set('n', '<leader>h' .. i, function() require('harpoon.term').sendCommand(1, i) end,
                    { desc = '[H]arpoon Comand [' .. i .. ']' })
            end
            vim.keymap.set('n', ',f', function() require('harpoon.ui').nav_file(1) end,
                { desc = 'Harpoon file 1' })
            vim.keymap.set('n', ',d', function() require('harpoon.ui').nav_file(2) end,
                { desc = 'Harpoon file 2' })
            vim.keymap.set('n', ',s', function() require('harpoon.ui').nav_file(3) end,
                { desc = 'Harpoon file 3' })
            vim.keymap.set('n', ',a', function() require('harpoon.ui').nav_file(4) end,
                { desc = 'Harpoon file 4' })
        end,
    },
}
