-- Catppuccin
--require("catppuccin").setup({
--    flavour = "macchiato", -- latte, frappe, macchiato, mocha
--    background = { -- :h background
--        light = "latte",
--        dark = "mocha",
--    },
--})
-- vim.cmd("colorscheme catppuccino")
--
-- Material
vim.g.material_style = "deep ocean"
vim.g.material_italic_comments = true

require("material").setup()
vim.cmd("colorscheme material")
