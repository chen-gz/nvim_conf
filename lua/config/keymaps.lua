-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- add keymaAp
vim.api.nvim_set_keymap(
  "n",
  "<leader>p",
  "<Cmd> lua require('project_nvim.project').add_project_manually()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true, silent = true })
