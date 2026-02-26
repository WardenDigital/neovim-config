return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 2500,
		},
		notify_on_error = true,
		formatters_by_ft = {
			php = { "phpcbf" },
			vue = { "prettier" },
			html = { "prettier" },
			js = { "prettier" },
			ts = { "prettier" },
			typescript = { "prettier" },
			svelte = { "prettier" },
			json = { "fixjson" },
			go = { "goimports" },
			nix = { "alejandra" },
		},
	},
}
