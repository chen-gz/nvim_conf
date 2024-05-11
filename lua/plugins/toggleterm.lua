return {
	'akinsho/toggleterm.nvim', version = "*", 
	opts = {--[[ things you want to change go here]]},
	keys = {
		-- { '<leader>tt', ':ToggleTerm<CR>' },
		-- { 't', '<leader>tt', '<C-\\><C-n>:ToggleTerm<CR>' },

		{
			"<leader>tt",
			function() 
				-- require('telescope.builtin').find_files()
				vim.cmd(":ToggleTerm")
			end,
			desc = "ToggleTerm",
		},
	},

}
