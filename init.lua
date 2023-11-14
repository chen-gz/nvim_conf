require('options')
require('keymap')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local cmp_nvim = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    config = function() 
        local cmp = require('cmp')
        cmp.setup({})
    end 
}
local lspconf = {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').clangd.setup{}
        require('lspconfig').pyright.setup{}
        require('lspconfig').gopls.setup{}
        require('lspconfig').rust_analyzer.setup{}
        require('lspconfig').texlab.setup{}
    end
}
local telescope_conf = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        {'nvim-telescope/telescope-fzy-native.nvim'}
    },
    config = function ()
        local telescope = require('telescope');
        telescope.load_extension('fzf')
    end
}

local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    -- event = {'LazyFile', 'VeryLazy'},
    opts = {
        highlight = { enable = true, },
        indent = { enable = true },
        ensure_installed = {"c", "lua", "vim", "python", "rust", "go"},
    },
}
local treesitter_context = {
    'romgrk/nvim-treesitter-context',
    enabled = true,
}
local neo_tree =
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    -- always show on startup
    lazy = false,
    
    config = function() 
        vim.cmd("Neotree show")
        -- auto close if no buffer is open
        vim.cmd("autocmd BufEnter * if (winnr('$') == 1 && exists('b:neo_tree') && b:neo_tree.win_open()) | q | endif")
        -- filesystem = {
        --     follow_current_file = {enable = false},
        -- }
        -- buffers ={
        --     follow_current_file = {enable = true},
        -- }

    end
    

}

local knap = {
    "frabjous/knap",
    keys = {
        {'<F5>', '<cmd>lua require("knap").process_once()<CR>', mode={'n', 'v', 'i'}},
    },
    ft = {'tex'},
    config = function ()
        vim.g.knap_settings = {
            textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
            textopdfviewerrefresh = "none",
            textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
            delay=0
        }


    end,



}


require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    { "catppuccin/nvim", config = require("theme") },
    {'nvim-lualine/lualine.nvim', config = require('plugin_lualine')},
    "github/copilot.vim",
    cmp_nvim,
    lspconf,
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    telescope_conf,
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    treesitter,
    treesitter_context,
    neo_tree,
    {'akinsho/toggleterm.nvim', version = "*", config = true,
    keys = {
        {'<C-\\>', '<Esc>:ToggleTerm size=50 direction=vertical<CR>', mode={'i', 'n', 'v', 't'}},
    }, },
    knap,
    {
        "ahmedkhalf/project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            manual_mode = false,
        },
        -- event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup(opts)
            -- require("lazyvim.util").on_load("telescope.nvim", function()
            -- end)
                require("telescope").load_extension("projects")
        end,
        keys = {
            { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
        lazy = false,
        
    }

})

