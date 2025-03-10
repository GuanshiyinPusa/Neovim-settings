return {
	"zaldih/themery.nvim",
	event = "VeryLazy",
	config = function()
		require("themery").setup({
			themes = {
				"tokyonight-day",
				"tokyonight-moon",
				"tokyonight-night",
				"tokyonight-storm",
			}, -- Your list of installed colorschemes
			livePreview = true, -- Apply theme while browsing. Default to true.
		})
	end,
}
