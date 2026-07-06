-- Aerial: a symbol outline sidebar for navigating large files/codebases fast.
-- Keymap (<leader>oa) lives in lua/keymap.lua.
return {
	"stevearc/aerial.nvim",
	cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		backends = { "lsp", "treesitter", "markdown", "man" },
		layout = { default_direction = "prefer_right" },
	},
}
