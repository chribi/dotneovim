local function on_attach(client, bufnr)
    vim.diagnostic.config {
        severity_sort = true,
    }

    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gpd', require('goto-preview').goto_preview_definition, '[G]oto [D]efinition (preview)')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gpr', require('goto-preview').goto_preview_references, '[G]oto [D]efinition (preview)')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gpi', require('goto-preview').goto_preview_implementation, '[G]oto [D]efinition (preview)')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('gpD', require('goto-preview').goto_preview_type_definition, '[G]oto [D]efinition (preview)')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    if client.server_capabilities.signatureHelpProvider then
        vim.api.nvim_buf_set_keymap(0, "n", "<A-s>", ":LspOverloadsSignature<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "i", "<A-s>", "<cmd>LspOverloadsSignature<CR>", { noremap = true, silent = true })
        require('lsp-overloads').setup(client, { })
    end
end

local function config_lsp()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason = require('mason-lspconfig')
    mason.setup { }

    local lspconfigs = {
        -- default
        function (server)
            require('lspconfig')[server].setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end,

        ['omnisharp'] = function()
            require('lspconfig').omnisharp.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                handlers = {
                    ['textDocument/definition'] = require('omnisharp_extended').handler,
                },
            }
        end,

        ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                    },
                },
            }
        end,
    }
    mason.setup_handlers(lspconfigs)
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- LSP Support
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
        {'folke/neodev.nvim',
            opts = {
                override = function(_, library)
                    library.enabled = true
                    library.types = true
                    library.plugins = true
                end
        } },
        'hrsh7th/cmp-nvim-lsp',
        { 'Hoffs/omnisharp-extended-lsp.nvim' },
        { 'Issafalcon/lsp-overloads.nvim' },
        "nvim-telescope/telescope.nvim",
        {
            'rmagatti/goto-preview',
            opts = {
                focus_on_open = false,
                dismiss_on_move = true,
            }
        },
    },
    init = config_lsp
}
