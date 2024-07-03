return {
    "neovim/nvim-lspconfig",
    config = function()
        require('lspconfig').rust_analyzer.setup({
            settings = {
                ["rust-analyzer"] = {},
            },
        })
        -- lua lsp
        require('lspconfig').lua_ls.setup({
        })
        -- c++ lsp
        require('lspconfig').clangd.setup({
            settings = {
                ['clangd'] = {
                    -- Enable completion
                    completion = {
                        -- Enable completion triggered by <c-x><c-o>
                        -- You may want to disable this in favor of a different completion
                        -- trigger, such as <c-n>.
                        triggerCompletion = true,
                    },
                    -- Enable diagnostics
                    diagnostics = {
                        -- Enable clangd diagnostics
                        enabled = true,
                    },
                    -- Enable semantic highlighting
                    semanticHighlighting = true,
                },
            },
        })
        -- python lsp
        require('lspconfig').pyright.setup({
            settings = {
                ['pyright'] = {

                },
            },
        })
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                --
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set('n', '<space>wl', function()
                -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
                -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>cf', function() vim.lsp.buf.format { async = true } end, opts)
                -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
                -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
            end,
        })
    end,
}
