local harpoon = require("harpoon")

local buffMapping = { "1", "2", "3", "4" }

local function getHotKey(index)
    if #buffMapping >= index then
        return buffMapping[index]
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

local function selectBuff(index)
    local list = harpoon:list()["items"]
    if not list[index] then
        vim.notify("No item at (" .. getHotKey(index) .. ")", 3)
    end
    harpoon:list():select(index)
end

vim.keymap.set("n", "<leader>q", function()
    local fileName = vim.fn.expand("%")
    local fileIndex = getFileItemIndex(fileName)
    if nil ~= fileIndex then
        return vim.notify("It's at (" .. getHotKey(fileIndex) .. ")")
    end
    harpoon:list():add()
    local items = harpoon:list()["items"]
    local index = #items
    vim.notify("(" .. getHotKey(index) .. ")" .. " ---}> " .. fileName)
end)

vim.keymap.set("n", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

for i, v in pairs(buffMapping) do
    local map = "<leader>" .. v
    vim.keymap.set("n", map, function()
        selectBuff(i)
    end)
end
