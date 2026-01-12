return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        event = "VeryLazy",
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                nerd_font_variant = 'code',
            },
            completion = {
                menu = {
                    border = 'single',
                    draw = {
                        components = {
                            kind_icon = {
                                text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
                            }
                        }
                    }
                },
                documentation = {
                    auto_show = true
                },
            },

            cmdline = {
                keymap = {
                    -- recommended, as the default keymap will only show and select the next item
                    ['<Tab>'] = { 'show', 'accept' },
                },
                completion = { menu = { auto_show = true } },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
