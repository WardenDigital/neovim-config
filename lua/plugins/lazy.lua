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
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },
    -- Themes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Tree side bar
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- Code highlight
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
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
    -- Tags advanced tool
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opt = {}},
    -- Folding/Unfolding code
    {'kevinhwang91/nvim-ufo', dependencies = {'kevinhwang91/promise-async'}},

}




require("lazy").setup(plugins, opts)
