-- persistence: auto-save a session per project dir; restore on demand.
-- Keymaps (<leader>o s/l/d) live in lua/keymap.lua.
return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
}
