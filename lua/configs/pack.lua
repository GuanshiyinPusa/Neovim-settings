-- =============================================================================
-- Plugin Management — vim.pack (built-in to Neovim 0.12)
-- =============================================================================
-- Replaces: lazy.nvim bootstrap + spec loading
--
-- Commands:
--   :restart                — restart nvim, installs new plugins on first run
--   vim.pack.update({})     — shows update buffer; :write to confirm, :quit to cancel
--   vim.pack.del({'name'})  — remove a plugin from disk
--
-- Lockfile: nvim-pack-lock.json (commit to version control)
-- =============================================================================

vim.pack.add({
	-- Colorscheme
	"https://github.com/folke/tokyonight.nvim",

	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",

	-- LSP (native vim.lsp.* used directly — no nvim-lspconfig needed in 0.12)
	"https://github.com/williamboman/mason.nvim",

	-- Formatting
	"https://github.com/stevearc/conform.nvim",

	-- Telescope (fuzzy finder)
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-file-browser.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-lua/plenary.nvim",

	-- File tree
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/MunifTanjim/nui.nvim", -- required by neo-tree
	"https://github.com/s1n7ax/nvim-window-picker",
	"https://github.com/nvim-tree/nvim-web-devicons",

	-- Git
	"https://github.com/lewis6991/gitsigns.nvim",

	-- UI and quality of life
	"https://github.com/folke/which-key.nvim",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/echasnovski/mini.surround",
})

-- Simple plugin setups (no separate config file needed)
require("mini.pairs").setup()
require("mini.surround").setup()
require("mason").setup()
