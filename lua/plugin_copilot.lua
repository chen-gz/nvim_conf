local use = require('packer').use
use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({})
    end,
}


use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
        require("copilot_cmp").setup()
    end
}

-- require("copilot").setup {
--     server_opts_overrides = {
--         trace = "verbose",
--         settings = {
--             advanced = {
--                 listCount = 10, -- #completions for panel
--                 inlineSuggestCount = 3, -- #completions for getCompletions
--             }
--         },
--     }
-- }
require("copilot").setup()
