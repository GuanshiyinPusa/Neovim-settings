-- Godbolt: view the assembly your C/C++ compiles to, inline (Compiler Explorer).
-- Great for systems study. Requires `curl`. Keymap (<leader>mg) in lua/keymap.lua.
return {
	"p00f/godbolt.nvim",
	cmd = { "Godbolt", "GodboltCompiler" },
	ft = { "c", "cpp" },
	opts = {},
}
