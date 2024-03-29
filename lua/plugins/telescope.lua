local function config_telescope()
    require('telescope').setup {
        defaults = {
            layout_config = {
                prompt_position = 'top'
            },
            sorting_strategy = 'ascending',
            path_display = {
                'truncate'
            },
            mappings = {
                n = {
                    ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
                    ["<c-i>"] = require("trouble.providers.telescope").open_with_trouble,
                },
                i = {
                    ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
                    ["<c-i>"] = require("trouble.providers.telescope").open_with_trouble,
                },
            },
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        [ '<c-d>' ] = require('telescope.actions').delete_buffer
                    },
                },
            },
        },
        extensions = {
            repo = {
                list = {
                    search_dirs = {
                        '~/code',
                        'C:/Projects',
                    },
                },
            },
            live_grep_args = {
                auto_quoting = false,
                layout_strategy = 'vertical',
            },
        }
    }
    local function nmap(lhs, builtin, desc)
        vim.keymap.set('n', lhs, function() require('telescope.builtin')[builtin]() end, { desc = desc })
    end

    -- files/buffers
    nmap('<leader>?', 'oldfiles', '[?] Find recently opened files')
    nmap('<leader><space>', "buffers", '[ ] Find buffers')
    nmap('<leader>ff', 'find_files', '[F]ind [F]iles')
    nmap('<leader>fF', 'git_files', '[F]ind [F]iles (repo)')
    nmap('<leader>fh', 'help_tags', '[F]ind [H]elp')

    -- grep
    -- nmap('<leader>fw', 'grep_string', '[F]ind [W]ord') => moved to live grep args
    nmap('<leader>/', 'current_buffer_fuzzy_find', '[/] fuzzy search')

    nmap('<leader>gb', 'git_branches',  '[G]it [B]ranches')
    nmap('<leader>gl', 'git_commits',  '[G]it [L]og')
    nmap('<leader>gfl', 'git_bcommits',  '[G]it [F]ile [L]og')
end

local function nmap(lhs, telescope_cmd, desc)
    vim.keymap.set('n', lhs, '<cmd>Telescope ' .. telescope_cmd .. '<cr>', { desc = desc })
end

return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = config_telescope,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').load_extension('file_browser')

            nmap('<leader>fb', 'file_browser', '[F]ile [B]rowser')
            nmap('<leader>fB', 'file_browser path=%:p:h select_buffer=true', '[F]ile [B]rowser (rel %)')
        end,
    },
    {
        'cljoly/telescope-repo.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').load_extension('repo')

            nmap('<leader>fp', 'repo', '[f]ind [p]roject')
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        config = function()
            require('telescope').load_extension('fzf')
        end,
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').load_extension('live_grep_args')

            nmap('<leader>fg', 'live_grep_args', '[f]ind with [g]rep')
            vim.keymap.set('n', '<leader>fw',  require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
                { desc = '[F]ind [W]ord' })
            vim.keymap.set('v', '<leader>fw',  require("telescope-live-grep-args.shortcuts").grep_visual_selection,
                { desc = '[F]ind [W]ord' })
        end
    }
}
