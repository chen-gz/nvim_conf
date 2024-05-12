return {
	'akinsho/toggleterm.nvim', version = "*", 
	config = function ()
		require("toggleterm").setup{
			size = 30, -- terminal size
			open_mapping = [[<c-\>]], -- shortcut to toggle terminal
			hide_numbers = true, -- hide line numbers in terminal mode
			shade_terminals = true,
			shading_factor = 2, -- terminal shading factor
			start_in_insert = true,
			direction = 'float', -- or 'vertical', 'tab', or 'float'
		}
	end,
	opts = {--[[ things you want to change go here]]},

}
