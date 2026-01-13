local dap, dapui = require("dap"), require("dapui")
dapui.setup()

-- Keymaps
vim.keymap.set("n", "<leader>dt", function()
    dapui.toggle()
end, { noremap = true, desc = "[D]ebug [T]oggle" })
vim.keymap.set("n", "<leader>dd", function()
    dap.toggle_breakpoint()
end, { noremap = true, desc = "[D]ebug [D]ump (Laravel dd() helper mnemonic)" })
vim.keymap.set("n", "<leader>dif", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { noremap = true, desc = "[D]ump [IF]" })
vim.keymap.set("n", "<F6>", function()
    dap.continue()
end, { noremap = true, desc = "Continue Debug" })
vim.keymap.set("n", "<F7>", function()
    dap.step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F8>", function()
    dap.step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F9>", function()
    dap.step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<F12>", function()
    dap.terminate()
end, { desc = "Terminate Debug session" })

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

-- Installed DAP servers --

local dap_install = {
    "delve", -- Go
    "php",   -- PHP
    "bash",  -- Bash
    "lua"
}

require("mason-nvim-dap").setup({
    ensure_installed = dap_install,
    handlers = {
        function(config)
            require("mason-nvim-dap").default_setup(config)
        end,
    },
    automatic_installation = true,
    automatic_setup = true,
})

dap.adapters.go = function(callback, _)
    callback({
        type = "server",
        host = "127.0.0.1",
        port = 2345,
    })
end

dap.configurations.go = {
    {
        type = "go",
        name = "Attach to Go (Docker)",
        request = "attach",
        mode = "remote",
        substitutePath = {
            {
                from = vim.fn.getcwd(),
                to = "/app",
            },
        },
    },
}

-- Styles
local signs = {
    DapBreakpoint = { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "" },
    DapStopped = { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "" },
    DapBreakpointCondition = { text = "", texthl = "DapBreakpointCondition", linehl = "DapBreakpointCondition", numhl = "" },
}

for name, sign in pairs(signs) do
    vim.fn.sign_define(name, sign)
end
