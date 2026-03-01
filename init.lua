-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Options
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250

require("lazy").setup("plugins")
require("keymaps")

vim.cmd.colorscheme("default")
-- These are required for nvim-ufo
vim.opt.foldcolumn = "1" -- '0' is also fine if you don't want the side bar
vim.opt.foldlevel = 99 -- Using ufo, we want most folds open by default
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- use spaces instead of tabstop
