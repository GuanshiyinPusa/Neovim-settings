-- =============================================================================
-- Which-key — shows available keymaps as you type
-- =============================================================================
-- Shows BOTH your custom keymaps AND built-in 0.12 defaults (gr*, [d, etc.)
-- Press <leader> and wait to see all leader keymaps
-- Press gr and wait to see all built-in LSP keymaps
-- =============================================================================

require("which-key").setup({
	delay = 300,
})

-- Register group labels for nice descriptions in the popup
require("which-key").add({
	{ "<leader>d", group = "Diff / Diagnostics" },
	{ "<leader>f", group = "Find (telescope)" },
	{ "<leader>g", group = "Git / Format" },
	{ "<leader>l", group = "LSP extras" },
	{ "<leader>m", group = "Format" },
	{ "<leader>e", group = "Explorer" },
	{ "<leader>o", group = "Old files" },
	{ "<leader>p", group = "Plugins" },
	{ "<leader>t", group = "Telescope LSP" },
	{ "<leader>w", group = "Workspace" },
	-- Built-in LSP prefix label
	{ "gr", group = "LSP (built-in)" },
})
