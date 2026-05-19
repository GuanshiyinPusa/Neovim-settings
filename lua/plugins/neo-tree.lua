-- =============================================================================
-- Neo-tree — file explorer
-- =============================================================================

require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		width = 35,
		mappings = {
			["<space>"] = "none", -- don't conflict with leader
		},
	},
})

-- Window picker (neo-tree dependency)
require("window-picker").setup({
	hint = "floating-big-letter",
})
