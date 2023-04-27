local use = require('packer').use

use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = false },
    config = require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'catppuccin',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat',{
                'filetype',
                fmt = function(str)
                    local icon = require('nvim-web-devicons')
                    if not icon.get_icon(vim.fn.expand('%:t'), vim.bo.filetype) then
                        -- or if you have the latest version of nvim-web-devicon
                        -- and don't care about buffer names
                        -- if not icon.get_icon_by_filetype(vim.bo.filetype) then
                        return nil
                    end

                    return str
                end,
                icon_only = true,
            }},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },

        tabline = {
            lualine_a = {'buffers'},
        },
        winbar = {
            --lualine_c = {'filename'},
        },
        inactive_winbar = {},
        extensions = {}
    }
}


