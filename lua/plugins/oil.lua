return {
    'stevearc/oil.nvim',
    config = function()
        local oil = require("oil")
        oil.setup({
            skip_confirm_for_simple_edits = true,
            float = {
                padding = 5,
                max_width = 130,
                max_height = 45,
            }
        })

        vim.keymap.set("n", "<leader>oF", "<cmd>Oil --float<cr>", { desc = "oil (current file)" })
        vim.keymap.set("n", "<leader>of", "<cmd>Oil . --float<cr>", { desc = "oil (working directory)" })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
