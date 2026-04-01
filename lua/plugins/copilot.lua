return {
	"huggingface/llm.nvim",
	opts = {
		backend = "ollama",
		model = "qwen3.5:9b",
		url = "http://llm.home:11434",
		lsp = {
			bin_path = "/run/current-system/sw/bin/llm-ls",
			LLM_LOG_LEVEL = "DEBUG",
		},
		request_body = {
			raw = true, -- Send the raw request body to the backend
			options = {
				temperature = 0.1, -- Keep it low for coding accuracy
				top_p = 0.95,
				num_predict = 128, -- Don't let it write a whole novel at once
				num_ctx = 4096,
			},
		},
		fim = {
			enabled = true,
			prefix = "<|fim_prefix|>",
			middle = "<|fim_middle|>",
			suffix = "<|fim_suffix|>",
		},
		context_window = 4096,
		enable_suggestions_on_startup = true,
		debounce_ms = 150,
	},
}
