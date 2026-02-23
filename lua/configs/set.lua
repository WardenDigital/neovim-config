-- Line number
vim.opt.nu = true
vim.opt.relativenumber = true
-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.swapfile = false
vim.o.winborder = "rounded"

-- Search & Hightlight

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

-- Scroll Padding
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "120"

vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Hide concealed text (mostly for Neorg)
vim.opt.conceallevel = 2
vim.opt.concealcursor = "ncv"
-- Disable autofolding on buffer Open
vim.opt.foldlevelstart = 99

vim.opt.virtualedit = "block"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Virtual text for spaces/tabs
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·" }

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})
