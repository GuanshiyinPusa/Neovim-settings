require("options")

vim.o.background = "" -- Unset background
-- Lazy.nvim Config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
-- Initialize Lazy.nvim
require("lazy").setup("plugins")

-- Autocmd
require("autocmd")

-- Keymap
require("keymap")
