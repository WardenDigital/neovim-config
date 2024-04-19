local neorg = require("neorg")

local config = {
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/Notes/notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
					work = "~/Notes/work",
				},
				index = "index.norg", -- The name of the main (root) .norg file
			},
			default_workspace = "notes",
		},
	},
}

neorg.setup(config)
