-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "py" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.tex" },
--   callback = function()
--     -- Save the current cursor position
--     local cur_pos = vim.api.nvim_win_get_cursor(0)
--
--     -- Set the text width and format the text
--     vim.opt_local.textwidth = 80
--     vim.cmd("normal gggqG")
--
--     -- Restore the cursor position
--     vim.api.nvim_win_set_cursor(0, cur_pos)
--   end,
-- })

--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = { "*.tex" },
--  callback = function()
--    -- Save the current view state
--    local saved_view = vim.fn.winsaveview()
--
--    -- Set the text width and format the text
--    vim.opt_local.textwidth = 80
--    vim.cmd("normal gggqG")
--
--    -- Restore the view state
--    vim.fn.winrestview(saved_view)
--  end,
--})
