return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        indent = {
            enabled = false,
            indent = {
                only_scope = true
            }
        },
        notifier = {},
        picker = {
            sources = {
                explorer = {
                    layout = {
                        layout = {
                            position = "right"
                        }
                    }
                }
            }
        }
    }
}
