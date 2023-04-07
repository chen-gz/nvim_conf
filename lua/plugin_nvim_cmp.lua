local use = require('packer').use

use {
    'hrsh7th/nvim-cmp',
    config = function ()
        local cmp = require 'cmp'


        local compare = require("cmp.config.compare")

        local t = function(str)
            return vim.api.nvim_replace_termcodes(str, true, true, true)
        end

        -- local has_words_before = function()
        --     -- local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --     -- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        --     return false;
        -- end
        local has_words_before = function()
            -- local cursor = vim.api.nvim_win_get_cursor(0)
            -- return not vim.api.nvim_get_current_line():sub(1, cursor[2]):match('^%s$')
            return false;
        end

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },

            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,
                    require("copilot_cmp.comparators").score,
                    compare.offset,
                    compare.exact,
                    compare.score,
                    require("cmp-under-comparator").under,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                    elseif has_words_before() then
                        -- cmp.mapping.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'spell' },
                { name = 'orgmode' },
                { name = 'latex_symbols' },
                { name = 'copilot' },
                { name = 'buffer' },
            },

            formatting = {
                format = function(entry, vim_item)
                    local lspkind_icons = {
                        Text = "",
                        Method = "",
                        Function = "",
                        Constructor = "",
                        Field = "",
                        Variable = "",
                        Class = "ﴯ",
                        Interface = "",
                        Module = "",
                        Property = "ﰠ",
                        Unit = "",
                        Value = "",
                        Enum = "",
                        Keyword = "",
                        Snippet = "",
                        Color = "",
                        File = "",
                        Reference = "",
                        Folder = "",
                        EnumMember = "",
                        Constant = "",
                        Struct = "",
                        Event = "",
                        Operator = "",
                        TypeParameter = "",
                    }
                    -- load lspkind icons
                    -- vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)
                    vim_item.kind = string.format("%s", lspkind_icons[vim_item.kind])

                    vim_item.menu = ({
                        -- cmp_tabnine = "[TN]",
                        buffer = "[BUF]",
                        orgmode = "[ORG]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[LUA]",
                        path = "[PATH]",
                        tmux = "[TMUX]",
                        luasnip = "[SNIP]",
                        spell = "[SPELL]",
                    })[entry.source.name]

                    return vim_item
                end,
            },
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- Set up lspconfig.
        --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        --     capabilities = capabilities
        -- }
        --

        -- function config.tabnine()
        -- 	local tabnine = require("cmp_tabnine.config")
        -- 	tabnine:setup({ max_line = 1000, max_num_results = 20, sort = true })
        -- end


        --luasnip()
        --autopairs()
    end

}
