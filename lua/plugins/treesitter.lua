-- =============================================================================
-- Treesitter — syntax highlighting, indentation, text objects
-- =============================================================================
-- NOTE: nvim-treesitter was rewritten for 0.12 (main branch).
-- The old require("nvim-treesitter.configs").setup{} API no longer exists.
-- =============================================================================

local treesitter = require("nvim-treesitter")
treesitter.setup()

-- Install parsers
treesitter.install({
	"lua",
	"c",
	"cpp",
	"python",
	"vim",
	"vimdoc",
	"query",
	"bash",
	"markdown",
	"markdown_inline",
	"json",
	"yaml",
	"toml",
	"ini",
})

-- Enable treesitter highlighting and indentation per filetype
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start()
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- Treesitter context (shows current function/class at top of buffer)
require("treesitter-context").setup({
	max_lines = 3,
	multiline_threshold = 1,
})
