local function config_telescope()
    require('telescope').setup {
        defaults = {
            layout_config = {
                prompt_position = 'top',
                mirror = true,
            },
            layout_strategy = 'vertical',
            sorting_strategy = 'ascending',
            path_display = {
                shorten = { len = 3, exclude = { 1, 2, -2, -1 } }
            },
            mappings = {
                n = {
                    ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
                    ["<M-t>"] = require("trouble.providers.telescope").open_with_trouble,
                },
                i = {
                    ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
                    ["<M-t>"] = require("trouble.providers.telescope").open_with_trouble,
                },
            },
        },

        pickers = {
            buffers = {
                mappings = {
                    i = {
                        [ '<M-d>' ] = require('telescope.actions').delete_buffer
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
                    fd_opts = {
                        '--no-ignore'
                    },
                    previewer = false,
                },
            },
            live_grep_args = {
                auto_quoting = true,
                layout_strategy = 'vertical',
                mappings = {
                    i = {
                        ["<M-d>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                    }
                }
            },
            undo = {
                use_delta = false,
            }
        }
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('repo')
    require('telescope').load_extension('live_grep_args')
    require('telescope').load_extension('undo')

    local builtin = require("telescope.builtin")
    local extensions = require("telescope").extensions;

    local function nmap(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { desc = desc })
    end

    -- files/buffers
    nmap('<leader>?', function() builtin.oldfiles({ cwd_only = true }) end, '[?] Find recently opened files')
    nmap('<leader><space>', function() builtin.buffers() end, '[ ] Find buffers')
    nmap('<leader>ff', builtin.find_files, '[F]ind [F]iles')
    nmap('<leader>fF', builtin.git_files, '[F]ind [F]iles (repo)')
    nmap('<leader>fh', builtin.help_tags, '[F]ind [H]elp')

    -- grep
    nmap('<leader>/', builtin.current_buffer_fuzzy_find, '[/] fuzzy search')

    -- git stuff
    nmap('<leader>gb', builtin.git_branches, '[G]it [B]ranches')
    nmap('<leader>gl', builtin.git_commits, '[G]it [L]og')
    nmap('<leader>gfl', builtin.git_bcommits, '[G]it [F]ile [L]og')

    -- extension mappings
    nmap('<leader>fb', extensions.file_browser.file_browser, '[F]ile [B]rowser')
    local function file_browser_rel_current()
        extensions.file_browser.file_browser({
            path = vim.fn.expand("%:p:h"),
            select_buffer = true
        })
    end
    nmap('<leader>fB', file_browser_rel_current, '[F]ile [B]rowser (rel %)')

    nmap('<leader>fp', extensions.repo.list, '[f]ind [p]roject')

    nmap("<leader>fu", extensions.undo.undo, "[f]ind in [u]ndo history")

    nmap('<leader>fg', extensions.live_grep_args.live_grep_args, '[f]ind with [g]rep')
    nmap('<leader>fw',  require("telescope-live-grep-args.shortcuts").grep_word_under_cursor, '[F]ind [w]ord')
    nmap('<leader>fW',
        function()
            local cWORD = vim.fn.expand("<cWORD>")
            extensions.live_grep_args.live_grep_args({ default_text = cWORD })
        end, '[F]ind [W]ORD')
    vim.keymap.set('v', '<leader>fw',  require("telescope-live-grep-args.shortcuts").grep_visual_selection,
        { desc = '[F]ind [W]ord' })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
            "nvim-telescope/telescope-file-browser.nvim",
            "cljoly/telescope-repo.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = config_telescope,
    },
}
