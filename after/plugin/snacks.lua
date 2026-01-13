-- Snaks picker module
local picker = require("snacks").picker


vim.keymap.set("n", "<leader>fp", function() require("snacks").picker() end)
vim.keymap.set("n", "<leader>ff", picker.files, { desc = "[F]ind [Files]" })
vim.keymap.set("n", "<leader>sg", function() picker.grep({ regex = false }) end, { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<leader>sr", picker.grep, { desc = "[S]earch [R]egex" })
vim.keymap.set({ "n", "v" }, "<leader>sw", picker.grep_word, { desc = "[S]earch [W]ord" })
vim.keymap.set("n", "<leader>sb", picker.grep_buffers, { desc = "[S]earch [B]uffers" })

vim.keymap.set("n", "<leader>fb", picker.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fh", picker.help, { desc = "[F]ind [H]elp-tags" })

-- Snacks dim module
local dim = require("snacks").dim
vim.keymap.set("n", "<leader>don", dim.enable, { desc = "[D]im [ON]" })
vim.keymap.set("n", "<leader>dof", dim.disable, { desc = "[D]im [OF]f" })

-- Lazygit
local lazygit = require("snacks.lazygit")
vim.keymap.set("n", "<leader>gs", lazygit.open)

-- Explorer
local ex = require("snacks.explorer")
vim.keymap.set("n", "<leader>pv", ex.open)
vim.keymap.set("n", "-", ex.reveal)

-- Notifier
local notifier = require("snacks.notifier")
vim.keymap.set("n", "<leader>dn", notifier.hide, { desc = "[D]elete [N]otifications" })

-- Indent
local indent = require("snacks.indent")
vim.keymap.set("n", "<leader>i", function()
    if indent.enabled then
        indent.disable()
    else
        indent.enable()
    end
end, { desc = "[D]elete [N]otifications" })
