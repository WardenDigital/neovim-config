local builtin = require("telescope.builtin")
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local lga_shortcuts = require("telescope-live-grep-args.shortcuts")

telescope.setup({
	extensions = {
		live_grep_args = {
			auto_quoting = true,
			mappings = {
				i = {
					["<C-q>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --no-ignore " }),
				},
			},
		},
	},
})

telescope.load_extension("dap")
telescope.load_extension("media_files")
telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<leader>fm", telescope.extensions.media_files.media_files, { desc = "[F]ind [M]edia-files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fa", function()
	builtin.find_files({ no_ignore = true })
end, { desc = "[F]ind [A]ll" })
vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args, { desc = "[F]ind [G]rep" })
vim.keymap.set("n", "<leader>fw", function()
	lga_shortcuts.grep_word_under_cursor({ quote = false, postfix = "" })
end, { desc = "[F]ind [W]ord" })
vim.keymap.set("v", "<C-f>", function()
	lga_shortcuts.grep_visual_selection({ quote = false, postfix = "" })
end, { desc = "[F]ind in visual mode" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp-tags" })
