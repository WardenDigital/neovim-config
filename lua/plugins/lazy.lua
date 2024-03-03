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

plugins = {
    -- Fussy search 
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-media-files.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons' },
        },
    },
    -- Themes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Code highlight
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { "jwalton512/vim-blade" },
    -- Git client
    { "tpope/vim-fugitive" },
    -- Harpoon
    { "ThePrimeagen/harpoon" },
    -- Undo Tree
    { "mbbill/undotree" },
    -- LSP
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"VonHeikemen/lsp-zero.nvim", branch = 'v3.x'},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/nvim-cmp"},
    {"L3MON4D3/LuaSnip"},
    -- Copilot
    {"github/copilot.vim"},
    -- Git blame
    {"f-person/git-blame.nvim", event = "VeryLazy"},
    -- Folding/Unfolding code
    {'kevinhwang91/nvim-ufo', dependencies = {'kevinhwang91/promise-async'}},
    -- MINI Nvim - set of small plugins
	{ 'echasnovski/mini.nvim', version = '*' },
    -- Vim Be Good - A Vim Learning Game
    { "ThePrimeagen/vim-be-good" },

}




require("lazy").setup(plugins, opts)
