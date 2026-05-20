return {
	"m4xshen/hardtime.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		-- Start gentle. Crank up restriction later once habits start sticking.
		max_time = 1000, -- ms window in which repeated keys are counted
		max_count = 3, -- block after 3 repeats in that window (default 3)
		disable_mouse = false, -- you probably still want mouse occasionally

		restriction_mode = "hint", -- "block" to fully block; "hint" only warns

		-- Show suggestions in the cmdline ("Use 5j instead of jjjjj")
		hint = true,
		notification = true,

		-- Don't fight these filetypes — they have their own navigation idioms
		disabled_filetypes = {
			"qf",
			"netrw",
			"neo-tree",
			"lazy",
			"mason",
			"oil",
			"notify",
			"noice",
			"TelescopePrompt",
			"help",
		},

		-- ThinkPad X1 Carbon physical keys — don't train against these
		disabled_keys = {
			["<Up>"]    = {},
			["<Down>"]  = {},
			["<Left>"]  = {},
			["<Right>"] = {},
			["<Home>"]  = {},
			["<End>"]   = {},
			["<PageUp>"]   = {},
			["<PageDown>"] = {},
			["<Insert>"] = {},
			["<Del>"]    = {},
		},
	},
}
