local use = require('packer').use

use {
    "frabjous/knap";
    config = function()

        require('knap');

        local kmap = vim.keymap.set
        kmap({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)
        kmap({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)
        kmap({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)
        kmap({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)

        vim.g.knap_settings = {
            textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
            textopdfviewerrefresh = "none",
            textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
            delay=0
        }

    end
}
