return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		require("nvim-treesitter")
			.install({
				"c",
				"cpp",
				"lua",
				"python",
				"yaml",
				"bash",
				"markdown",
				"markdown_inline",
				"rust",
				"html",
				"css",
				"vim",
				"vimdoc",
				"query",
			})
			:wait(300000)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"cpp",
				"lua",
				"python",
				"yaml",
				"bash",
				"markdown",
				"rust",
				"html",
				"css",
				"vim",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
