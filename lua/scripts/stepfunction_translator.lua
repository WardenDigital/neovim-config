vim.api.nvim_create_user_command("ToAWS", function()
    local path = vim.fn.expand("%")
    local command = "translator -out same -dict ~/Projects/work/dictionary.json " .. path
    local jobid = vim.fn.jobstart(command)
    vim.fn.jobwait({ jobid })
    vim.fn.execute(":e")
end, {})

vim.api.nvim_create_user_command("ToLocal", function()
    local path = vim.fn.expand("%")
    local command = "translator -target local -out same -dict ~/Projects/work/dictionary.json " .. path
    local jobid = vim.fn.jobstart(command)
    vim.fn.jobwait({ jobid })
    vim.fn.execute(":e")
end, {})
