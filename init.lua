local global = {}
local os_name           = vim.loop.os_uname().sysname
local vim               = vim
-- options

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
end)


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

vim.g.copilot_filetypes = {
    yaml = true,
    cpp = true
}

use {
    'nvim-tree/nvim-web-devicons',
    require'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh"
            }
        };
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true;
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true;
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
            [".gitignore"] = {
                icon = "",
                color = "#f1502f",
                name = "Gitignore"
            }
        };
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
            ["log"] = {
                icon = "",
                color = "#81e043",
                name = "Log"
            }
        };
    }
}

use {
    "nvim-treesitter/nvim-treesitter-context",
}
