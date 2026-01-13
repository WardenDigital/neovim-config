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
        explorer = {
            replace_netrw = true, -- Replace netrw with the snacks explorer
        },
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
