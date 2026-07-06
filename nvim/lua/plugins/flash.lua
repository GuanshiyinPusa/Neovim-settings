-- Flash: jump anywhere by label. Keymaps (s, S, r, R, <c-s>) live in
-- lua/keymap.lua.
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		-- Sensible defaults. Tweak later if labels feel noisy.
		modes = {
			search = {
				enabled = true, -- enables labels next to / and ? matches
			},
			char = {
				enabled = true, -- enhanced f/F/t/T with multi-line jumps
				jump_labels = true,
			},
		},
		label = {
			uppercase = false, -- avoid Shift; lowercase labels only
		},
	},
}
