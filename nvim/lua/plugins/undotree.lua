-- Undotree: visualize and browse the undo history as a tree.
-- Paired with persistent undo (options.lua: undofile). Keymap (<leader>uu) in
-- lua/keymap.lua.
return {
	"mbbill/undotree",
	cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide" },
	init = function()
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
