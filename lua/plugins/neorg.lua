return {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
        load = {
            ["core.keybinds"] = {
                config = {
                    default_keybinds = true,
                }
            },
            ["core.defaults"] = {},
            ["core.concealer"] = {
                config = {
                    icon_preset = "diamond",
                },
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/Notes/notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
                        work = "~/Notes/work",
                    },
                    index = "index.norg", -- The name of the main (root) .norg file
                    default_workspace = "notes",
                },
            },
        },
    }
}
