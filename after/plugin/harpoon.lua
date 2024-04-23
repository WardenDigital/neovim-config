local harpoon = require("harpoon")

local tabMapping = { "q", "w", "e", "r" }

local function getHotKey(index)
	if #tabMapping >= index then
		return tabMapping[index]
	end
	return ">.<"
end

local function getFileItemIndex(filename)
	local list = harpoon:list()["items"]
	for i, v in pairs(list) do
		if v["value"] == filename then
			return i
		end
	end
	return nil
end

harpoon.setup()

vim.keymap.set("n", "<leader>a", function()
	local fileName = vim.fn.expand("%")
	local fileIndex = getFileItemIndex(fileName)
	if nil ~= fileIndex then
		return print("It's at " .. getHotKey(fileIndex))
	end
	harpoon:list():add()
	local items = harpoon:list()["items"]
	local index = #items
	print("(" .. getHotKey(index) .. ")" .. " ---}> " .. fileName)
end)

vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

for i, v in pairs(tabMapping) do
	local map = "<leader>" .. v
	vim.keymap.set("n", map, function()
		harpoon:list():select(i)
	end)
end
