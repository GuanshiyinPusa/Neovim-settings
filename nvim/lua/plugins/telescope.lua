-- Telescope: fuzzy finder. Consolidated into a SINGLE setup() call — calling
-- telescope.setup() from multiple specs clobbers `defaults`, so file_browser
-- and ui-select are configured here as extensions and loaded up front.
-- Loading ui-select at startup is what makes vim.ui.select (code actions, the
-- DAP config picker, etc.) render as a clean Telescope dropdown instead of the
-- flickery built-in numbered prompt.
return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { preview_cutoff = 80, width = 0.9 },
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
				},
				pickers = {
					colorscheme = { enable_preview = true },
					find_files = { hidden = true },
					diagnostics = {
						layout_strategy = "horizontal",
						layout_config = { width = 0.95, height = 0.85, preview_width = 0.35 },
					},
				},
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
						mappings = { ["i"] = {}, ["n"] = {} },
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("file_browser")
			telescope.load_extension("ui-select")
		end,
	},
}
