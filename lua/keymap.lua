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

-- for buffer switch
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true });
-- save file also in insert mode
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true });

-- q to quit
vim.api.nvim_set_keymap('n', 'q', ':q<CR>', { noremap = true, silent = true });
-- esc go to normal mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true });
-- 
--
