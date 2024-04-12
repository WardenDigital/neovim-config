local dap, dapui = require("dap"), require("dapui")
dapui.setup()

vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dd", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>ddif",
	":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/Soft/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for xdebug",
		port = 9003,
	},
}

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
