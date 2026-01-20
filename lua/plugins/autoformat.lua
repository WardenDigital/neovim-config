return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 2500,
        },
        notify_on_error = true,
        formatters_by_ft = {
            php = { "phpcbf" },
            vue = { "prettier" },
            html = { "prettier" },
            js = { "prettier" },
            ts = { "prettier" },
            typescript = { "prettier" },
            svelte = { "prettier" },
            json = { "fixjson" },
            go = { "gofmt" },
        },
    }
}
