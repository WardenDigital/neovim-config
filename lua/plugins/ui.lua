return {
    -- Themes
    { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
    -- Fancy CMD line
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    -- Color for CSS
    { "NvChad/nvim-colorizer.lua" },
    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
    }
}
