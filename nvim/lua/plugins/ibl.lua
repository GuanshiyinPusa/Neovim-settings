return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"dashboard",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lspinfo",
				"TelescopePrompt",
				"TelescopeResults",
			},
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)

		-- COBOL classic fixed-format column guides.
		-- Columns: 1-6 sequence | 7 indicator | 8-11 Area A | 12-72 Area B | 73-80 identification
		-- We mark the boundaries: 7 (indicator), 8 (Area A start), 12 (Area B start), 73 (identification start).
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "cobol",
			callback = function()
				vim.opt_local.colorcolumn = "7,8,12,73"
				vim.opt_local.textwidth = 72
				vim.opt_local.tabstop = 4
				vim.opt_local.shiftwidth = 4
				vim.opt_local.expandtab = true
			end,
		})

		-- Optional: soften the colorcolumn color so it's a guide, not a wall.
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2a2a3a" })
	end,
}
