vim.api.nvim_create_user_command("List", function()
    vim.o.list = not vim.o.list
end, {})
