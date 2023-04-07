-- vim.o["winwinwidth"]    = 10;

---- keymap 
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true });

 vim.api.nvim_set_keymap('n', 'ff', "<cmd>lua require('telescope.builtin').find_files()<CR>",
    { noremap = true, silent = true });
