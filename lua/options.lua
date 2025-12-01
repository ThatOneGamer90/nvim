vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.scrolloff = 10
vim.o.list = true
vim.o.wrap = false
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.confirm = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.diagnostic.config({ virtual_text = true }) -- inline diagnostics
vim.diagnostic.config({ virtual_text = { severity = { min = vim.diagnostic.severity.WARN } } }) -- inline WARN or ERROR
