-- venv-selector: pick a Python virtualenv so pyright/debugpy use the right
-- interpreter. Run :VenvSelect (or <leader>mv, in lua/keymap.lua). Needs `fd`.
return {
	"linux-cultist/venv-selector.nvim",
	ft = "python",
	cmd = "VenvSelect",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		options = {
			-- Don't let venv-selector replace vim.notify (default true) —
			-- noice.nvim owns notifications, and the override triggers noice's
			-- "vim.notify has been overwritten" warning.
			override_notify = false,
		},
	},
}
