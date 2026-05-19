-- =============================================================================
-- Conform — formatting
-- =============================================================================
-- Keymaps: <leader>gf, <leader>mp, fa (defined in keymap.lua)
-- =============================================================================

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		-- json = { "prettier" },
		-- yaml = { "prettier" },
	},
	-- Uncomment to format on save:
	-- format_on_save = {
	--     timeout_ms = 500,
	--     lsp_fallback = true,
	-- },
})
