local dap, dapui = require("dap"), require("dapui")
dapui.setup()

-- Keymaps
vim.keymap.set("n", "<leader>dt", function()
	dapui.toggle()
end, { noremap = true })
vim.keymap.set("n", "<leader>dd", function()
	dap.toggle_breakpoint()
end, { noremap = true })
vim.keymap.set("n", "<leader>ddif", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { noremap = true })
vim.keymap.set("n", "<leader>dc", function()
	dap.continue()
end, { noremap = true })
vim.keymap.set("n", "<leader>dr", function()
	dapui.open({ reset = true })
end, { noremap = true })

-- Event listeners
dap.listeners.before.attach["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.launch["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

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

	{
		name = "run current script",
		type = "php",
		request = "launch",
		port = 9003,
		cwd = "${fileDirname}",
		program = "${file}",
		runtimeExecutable = "php",
	},
}
