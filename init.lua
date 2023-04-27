local global = {}
local os_name           = vim.loop.os_uname().sysname
local vim               = vim
-- options

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
require('plugin_nvim_cmp')
require('plugin_format')
require('plugin_indentline')

require('plugin_theme')
require('plugin_easy_escape')
use {
    "akinsho/toggleterm.nvim", tag = '*', 
}
require("toggleterm").setup{
    --open_mapping = [[<c-\>]],
}

vim.api.nvim_set_keymap('i', '<C-\\>', "<Esc><Cmd>ToggleTerm size=40 direction=vertical<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-\\>', "<Esc><Cmd>ToggleTerm size=40 direction=vertical<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('t', '<C-\\>', "<Esc><Cmd>ToggleTerm size=40 direction=vertical<CR>", { noremap = true, silent = true });
vim.g.mapleader = ","

use "frabjous/knap";
require('knap');
vim.api.nvim_set_keymap('n', '<F5>', "<Cmd>lua require('knap').process_once()<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('v', '<F5>', "<Cmd>lua require('knap').process_once()<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', '<F5>', "<Cmd>lua require('knap').process_once()<CR>", { noremap = true, silent = true });

-- local gknapsettings = {
--     texoutputext = "pdf",
--     textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
--     textopdfviewerlaunch = "mupdf %outputfile%",
--     textopdfviewerrefresh = "kill -HUP %pid%"
-- }
-- vim.g.knap_settings = gknapsettings



-- " F6 closes the viewer application, and allows settings to be reset "
-- inoremap <silent> <F6> <C-o>:lua require("knap").close_viewer()<CR>
-- vnoremap <silent> <F6> <C-c>:lua require("knap").close_viewer()<CR>
-- nnoremap <silent> <F6> :lua require("knap").close_viewer()<CR>
-- vim.api.nvim_set_keymap('n', '<F6>', "<Cmd>lua require('knap').close_viewer()<CR>", { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('v', '<F6>', "<Cmd>lua require('knap').close_viewer()<CR>", { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('i', '<F6>', "<Cmd>lua require('knap').close_viewer()<CR>", { noremap = true, silent = true });

-- " F7 toggles the auto-processing on and off "
-- inoremap <silent> <F7> <C-o>:lua require("knap").toggle_autopreviewing()<CR>
-- vnoremap <silent> <F7> <C-c>:lua require("knap").toggle_autopreviewing()<CR>
-- nnoremap <silent> <F7> :lua require("knap").toggle_autopreviewing()<CR>

-- vim.api.nvim_set_keymap('n', '<F7>', "<Cmd>lua require('knap').toggle_autopreviewing()<CR>", { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('v', '<F7>', "<Cmd>lua require('knap').toggle_autopreviewing()<CR>", { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('i', '<F7>', "<Cmd>lua require('knap').toggle_autopreviewing()<CR>", { noremap = true, silent = true });

 -- set shorter name for keymap function
local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
kmap({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)

--  let g:knap_settings = {
--     \ "mdtopdfviewerlaunch": "mupdf %outputfile%",
--     \ "mdtopdfviewerrefresh": "kill -HUP %pid%",
--     \ "markdowntopdfviewerlaunch": "mupdf %outputfile%",
--     \ "markdowntopdfviewerrefresh": "kill -HUP %pid%",
--     \ "textopdfviewerlaunch": "mupdf %outputfile%",
--     \ "textopdfviewerrefresh": "kill -HUP %pid%",
--     \ "textopdfforwardjump" : "false"
-- \ }
-- vim.g.knap_settings = {
--     mdtopdfviewerlaunch = "mupdf %outputfile%",
--     mdtopdfviewerrefresh = "kill -HUP %pid%",
--     markdowntopdfviewerlaunch = "mupdf %outputfile%",
--     markdowntopdfviewerrefresh = "kill -HUP %pid%",
--     textopdfviewerlaunch = "mupdf %outputfile%",
--     -- textopdfviewerrefresh = "pkill -HUP %pid%",
--     textopdfviewerrefresh = "pkill -HUP mupdf",
--     textopdfforwardjump = "false",
--     delay=0
-- }
-- let g:knap_settings = {
--     \ "textopdfviewerlaunch": "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
--     \ "textopdfviewerrefresh": "none",
--     \ "textopdfforwardjump": "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
-- \ }
vim.g.knap_settings = {
    textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
    textopdfviewerrefresh = "none",
    textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
    delay=0
}
