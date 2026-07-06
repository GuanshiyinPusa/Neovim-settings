-- LeetCode: solve problems in-editor for algorithm practice. Defaults to C++.
-- Run :Leet (or <leader>ml, in lua/keymap.lua); it guides you through login.
return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	cmd = "Leet",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	opts = {
		lang = "cpp", -- change to "python3" etc. per problem via :Leet lang
	},
}
