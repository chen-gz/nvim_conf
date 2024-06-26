-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- mapping the command key as control key in macos 

-- add keymaAp
vim.api.nvim_set_keymap(
  "n",
  "<leader>p",
  "<Cmd> lua require('project_nvim.project').add_project_manually()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "kk", "<Esc>", { noremap = true, silent = true })
-- map j gj
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
-- map <c-s> o save
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- toggle terminal
vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>lua require('toggleterm').toggle()<CR>", { noremap = true, silent = true })
 -- esc go to normal mode in terminal
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true });
-- map <C-q> to close all buffer
vim.api.nvim_set_keymap("n", "<C-q>", ":bufdo bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<F5>", function()
  if vim.fn.filereadable("Makefile") == 1 then
    vim.cmd("make!")
  else
    print("Makefile not found!")
  end
end, { noremap = true, silent = true })
vim.keymap.set("i", "<F5>", function()
  if vim.fn.filereadable("Makefile") == 1 then
    vim.cmd("make!")
  else
    print("Makefile not found!")
  end
end, { noremap = true, silent = true })
local function is_last_buffer()
  local loaded_buffers = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
      loaded_buffers = loaded_buffers + 1
      if loaded_buffers > 1 then
        return false
      end
    end
  end
  return loaded_buffers == 1
end

-- Key mapping for 'q'
vim.api.nvim_set_keymap("n", "q", "t", {
  noremap = true,
  silent = true,
  callback = function()
    if is_last_buffer() then
      -- If it's the last buffer, quit NeoVim
      -- before quit close neotree
      -- vim.cmd("Neotree close")
      vim.cmd("quit")
    else
      -- Otherwise, close the current buffer
      vim.cmd("bprevious | bd #")
    end
  end,
})

if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
