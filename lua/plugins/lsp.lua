return {
    {
        "mason-org/mason.nvim",
        event = "VeryLazy",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {
            automatic_enable = true,
            ensure_installed = {},
            automatic_installation = false,
        }
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "stylua", -- Used to format lua code
                "phpcs",  -- Used to format PHP code
            },
        },
    }
}
