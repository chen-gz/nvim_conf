-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- allow cursor move to everywhere in normal mode
vim.o["virtualedit"] = "all"
-- vim.o.guifont = "Source Code Pro:h21" -- text below applies for VimScript
-- vim.o.guifont = ":h21" -- text below applies for VimScript
vim.o.guifont = "JetBrainsmono Nerd Font:h18"
-- set tab size to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- disable mouse
vim.o.mouse = ""
--vim.o.ttymouse = ""
-- set width
vim.o.textwidth = 80
vim.o.colorcolumn = "80"
-- vim.g.neovide_transparency = 0.99
