return {
  {
    "frabjous/knap",
    ft = { "tex" },
    config = function()
      -- vim.g.knap_settings = {
      --   textopdfviewerlaunch = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,0)\"' --new-window %outputfile%",
      --   textopdfviewerrefresh = "none",
      --   textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,0)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
      -- }
      -- vim.g.knap_settings = {
      --   textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
      --   textopdfviewerrefresh = "none",
      --   textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
      --   delay = 0,
      -- }
      -- F5 to toggle preview neovim
      vim.api.nvim_set_keymap(
        "n",
        "<F5>",
        '<cmd>lua require("knap").toggle_autopreviewing()<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<F6>",
        '<cmd>lua require("knap").forward_jump()<CR>',
        { noremap = true, silent = true }
      )

      vim.o.wrap = true
    end,
    -- set word warp == true
  },
}
