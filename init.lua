local global = {}
local os_name           = vim.loop.os_uname().sysname
local vim               = vim
-- options

vim.g.mapleader = " "

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
end)

vim.cmd[[packadd packer.nvim]]

local use = require('packer').use



require('keymap')
require('plugin')

require('options')
require('plugin_lualine')
require('plugin_telescope')
require('plugin_treesitter')
--require('plugin_copilot')
-- require('plugin_nvim_cmp')
