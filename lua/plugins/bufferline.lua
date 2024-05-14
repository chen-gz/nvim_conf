return {
	'akinsho/bufferline.nvim', 
	event = "BufWinEnter",
	version = "*", 
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		--{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		--{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		--{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
		--{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		--{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		-- { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		-- { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
	config = function()
		require("bufferline").setup {
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				numbers = "ordinal",
				number_style = "superscript",
				mappings = true,
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator_icon = '▎',
				buffer_close_icon = '',
				modified_icon = '●',
				close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				max_name_length = 18,
				max_prefix_length = 15,
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return "("..count..")"

				end,

				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = 'extension'
			}
		}
	end
}
