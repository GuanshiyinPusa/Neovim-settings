return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "BufWinEnter",
		config = function()
			require("toggleterm").setup({
				-- Set the terminal to float mode
				direction = "float",

				-- Floating window options
				float_opts = {
					border = "curved", -- Can be "single", "double", "shadow", etc.
					width = function()
						return math.floor(vim.o.columns * 0.8)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.8)
					end,
					title_pos = "center", -- Title position
				},
			})
		end,
	},
}
