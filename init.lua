local global = {}
local os_name           = vim.loop.os_uname().sysname
local vim               = vim
-- options

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
end)

vim.cmd[[packadd packer.nvim]]

local use = require('packer').use
-- set leader to space
vim.g.mapleader = ' '


require('keymap')
require('plugin')

require('options')
require('plugin_lualine')
require('plugin_telescope')
require('plugin_treesitter')
require('plugin_nvim_cmp')
require('plugin_format')
require('plugin_indentline')

require('plugin_theme')
require('plugin_easy_escape')
require('plugin_toggleterm')
require('plugin_knap') -- for latex


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
use {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require("nvim-tree").setup()

    end
}
 vim.api.nvim_set_keymap('n', '<leader>n', "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true });
 vim.api.nvim_set_keymap('n', '<leader>nf', "<cmd>NvimTreeFindFile<CR>", { noremap = true, silent = true });
 vim.g.nvim_tree_auto_open = 1

-- require('sidebar-nvim/sidebar.nvim')
--use {
    --    'sidebar-nvim/sidebar.nvim',
    --    config = function()
        --        local sidebar = require("sidebar-nvim")
        --        local opts = {
            --            open = true,
            --            files = {
                --                icon = "",
                --                show_hidden = false,
                --                ignored_paths = {"%.git$"}
                --            },
                --            sections = {
                    --                "datetime",
                    --                "files",
                    --                --"git-status",
                    --                --"lsp-diagnostics",
                    --                -- "nvim-tree"
                    --            },
                    --        }
                    --        sidebar.setup(opts)
                    --    end
                    --}
                    --
