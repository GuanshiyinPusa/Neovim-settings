-- Oil: edit the filesystem like a normal buffer (rename/move/delete = text ops).
-- "-" (in lua/keymap.lua) opens the parent directory. Complements neo-tree.
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false, -- so "-" works before any Oil command is run
	opts = {
		-- telescope-file-browser already hijacks netrw; let it keep directory
		-- opens and reach Oil explicitly via "-" / :Oil to avoid a conflict.
		default_file_explorer = false,
		view_options = { show_hidden = true },
	},
}
