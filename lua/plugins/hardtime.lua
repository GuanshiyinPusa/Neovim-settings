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

		-- Leave Up/Down arrows alone in insert mode if you ever use them
		disabled_keys = {
			-- ["<Up>"] = false,
			-- ["<Down>"] = false,
		},
	},
}
