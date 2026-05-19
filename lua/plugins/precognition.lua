return {
	"tris203/precognition.nvim",
	event = "VeryLazy",
	opts = {
		-- Start hidden so it's not noisy by default.
		-- Use :Precognition peek to glance, :Precognition toggle to keep on.
		startVisible = false,
		showBlankVirtLine = true,
		highlightColor = { link = "Comment" },

		-- The motion hints shown above each line.
		-- prio = 0 hides a hint (use to silence motions you've mastered)
		hints = {
			Caret = { text = "^", prio = 2 },
			Dollar = { text = "$", prio = 1 },
			MatchingPair = { text = "%", prio = 5 },
			Zero = { text = "0", prio = 1 },
			w = { text = "w", prio = 10 },
			b = { text = "b", prio = 9 },
			e = { text = "e", prio = 8 },
			W = { text = "W", prio = 7 },
			B = { text = "B", prio = 6 },
			E = { text = "E", prio = 5 },
		},

		gutterHints = {
			G = { text = "G", prio = 10 },
			gg = { text = "gg", prio = 9 },
			PrevParagraph = { text = "{", prio = 8 },
			NextParagraph = { text = "}", prio = 8 },
		},

		disabled_fts = {
			"startify",
			"neo-tree",
			"TelescopePrompt",
			"lazy",
			"mason",
			"help",
		},
	},
	keys = {
		{ "<leader>up", "<cmd>Precognition peek<cr>", desc = "Precognition peek" },
		{ "<leader>uP", "<cmd>Precognition toggle<cr>", desc = "Precognition toggle" },
	},
}
