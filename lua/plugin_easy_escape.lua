local use = require('packer').use

-- better escape
use {
    'nvim-zh/better-escape.vim', 
    event = 'InsertEnter',
    config = function()
        -- vim.g.better_escape_shortcut = {'jj', 'kk', 'jk'}
        -- 'jk', 'kj', 'jj', 'kk'
        vim.g.better_escape_interval = 300
        vim.g.better_escape_no_mappings = 1
    end

}
-- use {
    --     'jdhao/better-escape.nvim',
    --     config = function()
        --         require('better_escape').setup {
            --             mapping = { 'jj', 'kk', 'jk' },
            --             timeout = 300,
            --             keys = { 'jk', 'kj' },
            --             clear_empty_line = false,
            --         }
            --     end,
            -- }
            -- 
