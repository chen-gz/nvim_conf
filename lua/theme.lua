return function() 
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
})
vim.cmd("colorscheme catppuccin")
end
