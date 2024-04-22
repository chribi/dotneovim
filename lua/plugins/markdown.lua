return {
    { 'preservim/vim-markdown' },
    { 'jakewvincent/mkdnflow.nvim',
        opts = {
            modules = {
                bib = false,
                cmp = true,
            },
            new_file_template = {
                use_template = true,
            },
            links = {
                conceal = true,
                transform_explicit = function(text)
                    text = text:gsub(' ', '-')
                    text = text:lower()
                    return text
                end,
            },
            mappings = {
                MkdnEnter = { { 'i', 'n', 'v' }, '<CR>' },
                MkdnGoBack = { 'n', '[w' },
                MkdnGoForward = { 'n', ']w' },
                MkdnCreateLinkFromClipboard = { { 'n', 'v' }, '<leader>wp' },
                MkdnDestroyLink = { 'n', '<leader>wd' },
                MkdnMoveSource = { 'n', '<leader>wm' },
                MkdnToggleToDo = { 'n', '<leader>wt' },
                MkdnUpdateNumbering = { 'n', '<leader>wn' },
                MkdnTableNewRowBelow = { 'n', '<leader>wr' },
                MkdnTableNewRowAbove = { 'n', '<leader>wR' },
                MkdnTableNewColAfter = { 'n', '<leader>wc' },
                MkdnTableNewColBefore = { 'n', '<leader>wC' },
            },
        },
    },
}

