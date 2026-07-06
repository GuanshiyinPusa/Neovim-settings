return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	-- Widen the Claude split. Default is 0.30 (30% of the window); 0.50 gives
	-- Claude half the width. Adjust split_width_percentage to taste (0.0–1.0).
	opts = {
		terminal = {
			split_side = "right",
			split_width_percentage = 0.42,
		},
	},
	-- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
	-- so `:ClaudeCode` and friends work on a fresh start. Keymaps (<leader>a*)
	-- live in lua/keymap.lua.
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeTreeAdd",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
		"ClaudeCodeOpen",
		"ClaudeCodeClose",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
		"ClaudeCodeCloseAllDiffs",
	},
}
