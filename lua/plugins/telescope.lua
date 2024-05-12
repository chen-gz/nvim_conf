return {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		-- local builtin = require('telescope.builtin')
		-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		{
			"<leader>ff",
			function() 
				require('telescope.builtin').find_files()
			end,
			desc = "Telescope find files",
		},
		{
		    "<leader><space>",
			function() 
				require('telescope.builtin').find_files()
			end,
			desc = "Telescope find files",
		},
		{
			"<leader>fg",
			function() 
				require('telescope.builtin').live_grep()
			end,
			desc = "Telescope live grep",
		},
	}

	-- {
	-- "<leader>fe",
	-- 	function()
	-- 		require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
	-- 	end,
	-- 	desc = "Explorer NeoTree (cwd)",
	-- },
}

