return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000, -- load early so it wins the diagnostic virtual-text handler
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			options = {
				-- Show the full message near the cursor instead of the closest one.
				show_all_diags_on_cursorline = true,
				-- THE fix for truncation: wrap long messages by window width
				-- instead of scrolling/cutting them off at the edge.
				overflow = {
					mode = "wrap",
				},
				-- Render messages that span multiple lines fully.
				multilines = {
					enabled = true,
					always_show = false,
				},
				-- Tag the linter/LSP that produced the message when there's more
				-- than one source (e.g. cpplint vs clangd).
				show_source = {
					enabled = true,
					if_many = true,
				},
			},
		})
		-- Required: turn off native virtual text so the two don't fight.
		-- (virtual_lines is also disabled below in lspconfig's config.)
		vim.diagnostic.config({ virtual_text = false })
	end,
}
