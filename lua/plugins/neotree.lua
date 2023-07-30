return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = true,
    cmd = { 'Neotree' },
    opts = {
        sources = { 'filesystem', 'git_status', 'document_symbols' },
        enable_diganostics = false,
        default_component_configs = {
            git_status = {
                symbols = {
                    -- Change type
                    added     = "✚", -- NOTE: you can set any of these to an empty string to not show them
                    deleted   = "✖",
                    modified  = "",
                    renamed   = "󰁕",
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "",
                    staged    = "",
                    conflict  = "",
                },
                align = "right",
            },
        }
    },
    init = function()
        local function nmap(lhs, neotreecmd, desc)
            vim.keymap.set('n', '<leader>' .. lhs, '<cmd>Neotree ' .. neotreecmd .. '<cr>',
                { silent = true, desc = desc })
        end
        nmap('nf', 'toggle source=filesystem', '[N]eo [F]iles')
        nmap('ng', 'toggle source=git_status', '[N]eo [G]it status')
        nmap('ns', 'toggle source=document_symbols position=right', '[N]eo document [S]ymbols')
    end
}
