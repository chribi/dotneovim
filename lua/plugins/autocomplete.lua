local function config_completion()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'


    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').load()
    luasnip.config.setup {
        update_events = 'TextChanged,TextChangedI',
    }

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },

            ['<C-K>'] = cmp.mapping(
                function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        cmp.complete {
                            config = { sources = { { name = 'luasnip' } } }
                        }
                    end
                end,
                { 'i', 's' }

            ),

            ['<C-Q>'] = cmp.mapping.close(),

            ['<Tab>'] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's'}),

            ['<S-Tab>'] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's'}),

            ['<C-J>'] = cmp.mapping(
                function(fallback)
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    else
                        fallback()
                    end
                end,
                { 'i', 's'}),
        },
        sources = {
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'nvim_lsp' },
            { name = 'path' },
        },
        formatting = {
            format = require('lspkind').cmp_format {
                mode = 'symbol_text',
                menu = {
                    luasnip = '[snp]',
                    nvim_lua = '[lua]',
                    nvim_lsp = '[lsp]',
                    path = '[pth]',
                },
            },
        },
    }
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } },
            { name = 'path' },
        }
    })
end
return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- completions
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        -- snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        -- 'rafamadriz/friendly-snippets',
        -- icons
        'onsails/lspkind.nvim',
    },
    config = config_completion,
}
