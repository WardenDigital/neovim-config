local autocomplete = require("conform")

autocomplete.setup({
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    },
    notify_on_error = true,
    formatters_by_ft = {
        php = { "phpcbf" },
    },
})
