local use = require('packer').use
use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        -- require("indent_blankline").setup {
        --     show_current_context = true,
        --     show_current_context_start = true,
        -- }
        -- migrate to v3    
        require("ibl").setup()
    end
}
