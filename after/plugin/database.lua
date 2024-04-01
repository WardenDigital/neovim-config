vim.keymap.set("n", "<leader>db", function()
	vim.cmd("DBUIToggle")
end)

vim.api.nvim_create_autocmd("FileType", {
	desc = "Attach database autocomplete",
	pattern = { "mysql", "pgsql", "sql" },
	callback = function()
		require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
	end,
})
