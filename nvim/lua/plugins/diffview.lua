-- Diffview: side-by-side diffs and file history. Handy for reviewing edits
-- (e.g. what Claude CLI changed). Keymaps (<leader>g d/D/h/H) in lua/keymap.lua.
return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}
