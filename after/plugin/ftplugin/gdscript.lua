local lspconfig = require("lspconfig")
lspconfig.gdscript.setup({})

local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
-- set Godot External Text Editor command to "nvim" and flag to "--server /home/warden-home/.cache/nvim/server.pipe --remote-send "<C-\><C-N>:n {file}<CR>:call cursor({line},{col})<CR>"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
