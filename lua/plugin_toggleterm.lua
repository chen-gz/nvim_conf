local use = require('packer').use

use { 
    "akinsho/toggleterm.nvim", 
    tag = '*', 
    config = function()
        require("toggleterm").setup{
            --open_mapping = [[<c-\>]],
        }
        vim.api.nvim_set_keymap('i', '<C-\\>', "<Esc><Cmd>ToggleTerm size=40 direction=vertical<CR>", { noremap = true, silent = true });
        vim.api.nvim_set_keymap('n', '<C-\\>', "<Esc><Cmd>ToggleTerm size=40 direction=vertical<CR>", { noremap = true, silent = true });
        vim.api.nvim_set_keymap('t', '<C-\\>', "<Esc><Cmd>ToggleTerm size=40 direction=vertical<CR>", { noremap = true, silent = true });
        vim.g.mapleader = ","
    end
}
