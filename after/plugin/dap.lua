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

-- Styles
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "󰺴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
