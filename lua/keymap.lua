-- vim.o["winwinwidth"]    = 10;

---- keymap 
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true });
-- ctrl + h,j,k,l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true });

 vim.api.nvim_set_keymap('n', 'ff', "<cmd>lua require('telescope.builtin').find_files()<CR>",
    { noremap = true, silent = true });
