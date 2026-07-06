-- hawtkeys: audit your keymaps for clashes and easier-to-hit alternatives.
-- Keymaps (<leader>uh, <leader>ud) live in lua/keymap.lua.
return {
	"tris203/hawtkeys.nvim",
	-- Load on command — you don't need this running all the time,
	-- just when you want to audit your keymaps.
	cmd = {
		"Hawtkeys",
		"HawtkeysAll",
		"HawtkeysDupes",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	opts = {},
}
