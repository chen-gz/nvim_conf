return {
  {
    "frabjous/knap",
    ft = { "tex" },
    config = function()
      vim.g.knap_settings = {
        textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
        delay = 0,
      }
      -- F5 to toggle preview neovim
      vim.api.nvim_set_keymap(
        "n",
        "<F5>",
        '<cmd>lua require("knap").toggle_autopreviewing()<CR>',
        { noremap = true, silent = true }
      )
      vim.o.wrap = true
    end,
    -- set word warp == true
  },
}
