local companion = require("codecompanion")

local config = {
	strategies = {
		chat = {
			adapter = {
				name = "copilot",
				model = "gpt-5-mini",
			},
			roles = {
				llm = function(adapter)
					return "CodeCompanion (" .. adapter.formatted_name .. " : " .. adapter.model.name .. ")"
				end,
				user = "Warden_Digital",
			},
		},
		inline = {
			adapter = {
				name = "copilot",
				model = "gpt-5-mini",
			},
		},
		cmd = {
			adapter = {
				name = "copilot",
				model = "gpt-5-mini",
			},
		},
	},
	display = {
		chat = {
			window = {
				position = "right", -- "left", "right", "top", "bottom"
			},
		},
		action_palette = {
			width = 95,
			height = 10,
			prompt = "Prompt ",
			provider = "snacks", -- Can be "default", "telescope", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
			opts = {
				show_default_actions = true, -- Show the default actions in the action palette?
				show_default_prompt_library = true, -- Show the default prompt library in the action palette?
			},
		},
	},
}

companion.setup(config)

vim.keymap.set("n", "<leader>aa", function()
	companion.toggle()
end, { desc = "[A]vante [A]i // Legacy binding" })

vim.keymap.set({ "n", "v" }, "<leader>ai", ":CodeCompanion", { desc = "[A]i [I]nline" })
vim.keymap.set({ "n", "v" }, "<leader>ap", ":CodeCompanionActions<CR>", { desc = "[A]i action [P]alette" })

vim.cmd([[cab cc CodeCompanion]])
