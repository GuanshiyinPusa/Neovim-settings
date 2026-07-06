-- todo-comments: highlight and navigate TODO/FIXME/NOTE/HACK markers.
-- Keymaps (]t [t, <leader>ft, <leader>xt) live in lua/keymap.lua.
return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
}
