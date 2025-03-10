return {
	{
		"nvim-telescope/telescope.nvim",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { preview_cutoff = 60, width = 0.9 },
					extensions = {
						file_browser = {
							theme = "ivy",
							-- disables netrw and use telescope-file-browser in its place
							hijack_netrw = true,
						},
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
