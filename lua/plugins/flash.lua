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
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash jump",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle flash search",
		},
	},
}
