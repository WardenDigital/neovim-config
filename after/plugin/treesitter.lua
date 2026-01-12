require("nvim-treesitter.configs").setup({
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    modules = {},
    incremental_selection = {
        enable = true,
        keymaps = {
            -- [S]tart [S]election
            init_selection = "<Leader>ss",
            -- [S]elect [I]ncrement
            node_incremental = "<Leader>si",
            -- [S]elect s[C]ope
            scope_incremental = "<Leader>sc",
            -- [S]elect [D]ecrement
            node_decremental = "<Leader>sd",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "[A]round [F]unction" },
                ["if"] = { query = "@function.inner", desc = "[I]nside [F]unction" },
                ["ac"] = { query = "@class.outer", desc = "[A]round [C]lass" },
                ["ic"] = { query = "@class.inner", desc = "[I]nside [C]lass" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "[A]t [S]cope" },
            },
            include_surrounding_whitespace = true,
        },
    },
})
