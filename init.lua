-- Set leader key first (must be before any keymaps or plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load options early
require("configs.options")

-- Load plugins via vim.pack (replaces lazy.nvim bootstrap)
require("configs.pack")

-- Load core config
require("configs.autocmds")
require("configs.diagnostics")
require("configs.lsp")

-- Load plugin configs (protected — won't error on first launch before install)
local plugin_configs = {
	"plugins.treesitter",
	"plugins.telescope",
	"plugins.neo-tree",
	"plugins.gitsigns",
	"plugins.conform",
	"plugins.which-key",
}

for _, mod in ipairs(plugin_configs) do
	local ok, err = pcall(require, mod)
	if not ok then
		vim.notify("Plugin config not loaded: " .. mod .. "\n" .. err, vim.log.levels.WARN)
	end
end

-- Load keymaps after everything is set up
require("configs.keymap")

-- Set colorscheme (protected — tokyonight may not be installed yet)
local ok, _ = pcall(vim.cmd.colorscheme, "tokyonight-moon")
if not ok then
	vim.cmd.colorscheme("default")
end
