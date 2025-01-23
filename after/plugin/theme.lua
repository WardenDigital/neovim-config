-- Catppuccin
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    styles = {
        comments = {},
        conditionals = {},
    }
})

require("notify").setup({
  background_colour = "#000000",
})

vim.cmd("colorscheme catppuccin")
