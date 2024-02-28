vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move visually-chosen lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without buffer-sub
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Ctrl + C 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Esc to normal mode remap
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")
