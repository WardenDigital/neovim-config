return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            --  Useful status updates for LSP.
            --  NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim", opts = {} },
        },
    },
    { "hrsh7th/cmp-nvim-lsp" },
}
