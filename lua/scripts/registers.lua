--------------------
---     PHP      ---
--------------------
vim.api.nvim_create_augroup("PHPMacro", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    group = "PHPMacro",
    pattern = {"*.php"},
    callback = function()
        vim.setreg("l", "yodd('^[pA: ',^[pa);^[");
    end
})
