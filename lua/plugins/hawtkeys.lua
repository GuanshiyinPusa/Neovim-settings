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
	opts = {
		-- Defaults are good. Run :HawtkeysDupes to find clashes,
		-- :Hawtkeys to get suggestions for easier-to-hit mappings.
	},
	keys = {
		{ "<leader>uh", "<cmd>Hawtkeys<cr>", desc = "Hawtkeys: suggest better keymaps" },
		{ "<leader>ud", "<cmd>HawtkeysDupes<cr>", desc = "Hawtkeys: find duplicates" },
	},
}
