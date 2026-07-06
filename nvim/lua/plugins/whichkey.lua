return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			border = "rounded",
			padding = { 1, 2 },
		},
		spec = {
			-- Group labels — these make <leader> popups readable instead of
			-- a wall of un-categorised mappings.
			{ "<leader>f", group = "find / format" },
			{ "<leader>g", group = "go / git / format" },
			{ "<leader>c", group = "code" },
			{ "<leader>w", group = "workspace" },
			{ "<leader>l", group = "lint / lazygit" },
			{ "<leader>r", group = "run / rename" },
			{ "<leader>m", group = "misc" },
			{ "<leader>t", group = "telescope (LSP)" },
			{ "<leader>d", group = "diagnostics" },
			{ "<leader>o", group = "open" },
			{ "<leader>q", group = "quickfix" },
			{ "<leader>s", group = "spelling" },
			{ "<leader>k", group = "keymaps" },
			{ "<leader>u", group = "ui / utilities" }, -- new: precognition + hawtkeys live here
			{ "<leader>n", group = "neotree" },
			{ "<leader>b", group = "debug" }, -- nvim-dap
			{ "<leader>x", group = "trouble" }, -- trouble.nvim
			{ "<leader>a", group = "AI / Claude" }, -- claudecode.nvim
		},
	},
	-- Keymaps (including <leader>?) live in lua/keymap.lua.
}
