-- smart-splits: move/resize between Neovim splits AND kitty windows with the
-- same keys (<C-hjkl> move, <A-hjkl> resize — defined in lua/keymap.lua).
-- NOTE: seamless kitty<->nvim movement also needs kitty.conf changes + the
-- bundled kitten (see ~/.config/kitty/kitty.conf).
return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	build = "./kitty/install-kittens.bash", -- installs the kitty kittens used for cross-window moves
	opts = {
		-- 'wrap' is unsupported on kitty (layout isn't queryable via CLI), so 'stop'.
		at_edge = "stop",
		multiplexer_integration = "kitty",
	},
}
