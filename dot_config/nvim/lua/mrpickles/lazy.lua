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
vim.g.mapleader = " "

require("lazy").setup({

    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    {'nvim-treesitter/nvim-treesitter',  build = ":TSUpdate" },

    { 'j-hui/fidget.nvim', version = 'legacy' },
    'romgrk/nvim-treesitter-context',
    'Saecki/crates.nvim',
    'akinsho/pubspec-assist.nvim',
    'simrat39/rust-tools.nvim',
    'folke/tokyonight.nvim',
    'maxmx03/FluoroMachine.nvim',
    'nvim-treesitter/playground',
    'numToStr/Comment.nvim',
    'windwp/nvim-autopairs',
    'akinsho/toggleterm.nvim',
    'lukas-reineke/lsp-format.nvim',
    'mfussenegger/nvim-dap',
    'nvim-tree/nvim-web-devicons',
    'kylechui/nvim-surround',
    'folke/neodev.nvim',

    { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
    'arkav/lualine-lsp-progress',
    {
        'nvim-lualine/lualine.nvim'
    },
    { 'romgrk/barbar.nvim', dependencies = 'nvim-web-devicons' },


    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'MrPickles1324/friendly-snippets' },
        }
    },
})
