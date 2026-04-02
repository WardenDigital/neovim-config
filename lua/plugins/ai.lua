return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"milanglacier/minuet-ai.nvim",

		config = function()
			require("minuet").setup({
				virtualtext = {
					auto_trigger_ft = { "php" },
					keymap = {
						-- accept whole completion
						accept = "<A-j>",
						-- accept one line
						accept_line = "<C-j>",
						-- accept n lines (prompts for number)
						-- e.g. "A-z 2 CR" will accept 2 lines
						accept_n_lines = "<C-n>",
						-- Cycle to prev completion item, or manually invoke completion
						prev = "<A-[>",
						-- Cycle to next completion item, or manually invoke completion
						next = "<A-]>",
						dismiss = "<A-e>",
					},
				},
				provider = "openai_fim_compatible",
				n_completions = 1, -- recommend for local model for resource saving
				-- I recommend beginning with a small context window size and incrementally
				-- expanding it, depending on your local computing power. A context window
				-- of 512, serves as an good starting point to estimate your computing
				-- power. Once you have a reliable estimate of your local computing power,
				-- you should adjust the context window to a larger value.
				context_window = 2048,
				provider_options = {
					openai_fim_compatible = {
						api_key = "TERM",
						name = "Ollama",
						end_point = "http://llm.home:11434/v1/completions",
						model = "qwen2.5-coder:7b",
						optional = {
							max_tokens = 120,
							top_p = 0.9,
						},
					},
				},
			})
		end,
	},
}
