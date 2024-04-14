return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},

	{ "f-person/git-blame.nvim", event = "VeryLazy" },
}
