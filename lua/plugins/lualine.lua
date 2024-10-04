return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_y = {
					{
						"datetime",
						style = "%m-%d %H:%M:%S",
					},
				},
			},
		})
	end,
}
