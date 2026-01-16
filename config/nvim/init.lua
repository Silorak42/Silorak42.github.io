-----------------------------------------------------------
-- Bootstrap lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    end
    vim.opt.rtp:prepend(lazypath)

    -----------------------------------------------------------
    -- Plugins
    -----------------------------------------------------------
    require("lazy").setup({

        -- LaTeX
        {
            "lervag/vimtex",
            lazy = false,
        },

        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
        },

        -- LSP
        {
            "neovim/nvim-lspconfig",
        },

        -- Autocomplete
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "L3MON4D3/LuaSnip",
            },
        },

        -- Statusline
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        -- Colorscheme
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
        },
    })

    -----------------------------------------------------------
    -- General settings
    -----------------------------------------------------------
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.wrap = false
    vim.opt.termguicolors = true
    vim.opt.signcolumn = "yes"
    vim.opt.clipboard = "unnamedplus"
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    vim.cmd.colorscheme("tokyonight")

    -----------------------------------------------------------
    -- Statusline
    -----------------------------------------------------------
    require("lualine").setup({
        options = {
            theme = "tokyonight",
            section_separators = "",
            component_separators = "",
        },
    })

    -----------------------------------------------------------
    -- VimTeX configuration
    -----------------------------------------------------------
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"

    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_imaps_enabled = 1

    vim.g.vimtex_log_ignore = {
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
    }

    ---------------------
