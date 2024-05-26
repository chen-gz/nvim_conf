-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- allow cursor move to everywhere in normal mode
-- vim.o["virtualedit"] = "all"
vim.o.virtualedit = "all"
-- vim.o.guifont = "Source Code Pro:h21" -- text below applies for VimScript
-- vim.o.guifont = ":h21" -- text below applies for VimScript
vim.o.guifont = "JetBrainsmono Nerd Font:h14"
-- set tab size to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- disable mouse
vim.o.mouse = ""
--vim.o.ttymouse = ""
-- set width
vim.o.textwidth = 80
vim.o.colorcolumn = "80"
vim.o.number = true
-- vim.g.neovide_transparency = 0.99
--
---- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
-- vim.g.lazyvim_python_lsp = "pylsp"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"
vim.g.autoformat = false
-- Example using a list of specs with the default options
--
-- allow scrolling past the end of the file
vim.o.scrolloff = 10
vim.o.display = vim.o.display .. ",lastline"
-- clipboard
vim.o.clipboard = "unnamedplus"
-- relative line numbers
vim.wo.relativenumber = true
-- prevent auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- formatoptions -= "cro"
--
-- vim.o.formatoptions = vim.o.formatoptions:gsub("cro", "")
-- no last line  (height = 0)
-- vim.o.laststatus = 1
vim.o.cmdheight = 0

-- word wrap on 120 or edge of window
vim.opt.wrap = true

-- fold setting
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
-- color row
vim.o.cursorline = true
vim.o.showbreak = "↪"

-- insert spaces instead of tabs
vim.o.expandtab = true
