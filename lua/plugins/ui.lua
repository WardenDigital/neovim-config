return {
    -- Themes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = true,
            float = {
                transparent = true,
            },
            custom_highlights = function(colors)
                return {
                    DapBreakpoint = { fg = colors.red },
                    DapStopped = { fg = colors.green },
                }
            end



        }
    },
    -- Fancy CMD line
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- use lsp borders for floating windows
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
    },
    -- Color for CSS
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                css = true,
                mode = "virtualtext",
            },
        }
    },
    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        'nvimdev/lspsaga.nvim',
        event = "VeryLazy",
        opts = {},
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
    }
}
