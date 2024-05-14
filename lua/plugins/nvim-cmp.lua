return {
 	'hrsh7th/nvim-cmp',
 	dependencies  = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require('cmp').setup {
			-- snippet = {
			-- 	expand = function(args)
			-- 		vim.fn["vsnip#anonymous"](args.body)
			-- 	end,
			-- },
			mapping = {
				["<C-n>"] = require('cmp').mapping.select_next_item(),
				["<C-p>"] = require('cmp').mapping.select_prev_item(),
				["<C-d>"] = require('cmp').mapping.scroll_docs(-4),
				["<C-f>"] = require('cmp').mapping.scroll_docs(4),
				["<C-Space>"] = require('cmp').mapping.complete(),
				-- ["<C-e>"] = require('cmp').mapping.close(),
				["<CR>"] = require('cmp').mapping.confirm {
					behavior = require('cmp').ConfirmBehavior.Insert,
					select = true,
				},
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },
				{ name = 'buffer' },
			},
		}
	end

}

