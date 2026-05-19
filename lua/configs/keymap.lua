-- =============================================================================
-- Keymaps
-- =============================================================================
--
-- Leader key is set in init.lua (must be set before any keymaps or plugins)
--
-- NEOVIM 0.12 BUILT-IN DEFAULTS — DO NOT OVERRIDE:
--
-- LSP (global, created at startup):
--   grn  → rename           gra → code action      grr → references
--   gri  → implementation   grt → type definition   grx → run codelens
--   gO   → document symbols K   → hover
--   C-s  (insert) → signature help
--   C-]  → go to definition  gx  → open link / documentLink
--
-- Diagnostics (global):
--   [d / ]d  → prev/next diagnostic    C-w d → diagnostic float
--
-- Completion (insert mode, when popup visible):
--   C-y  → accept     C-e → dismiss     C-n / C-p → next/prev
--   Arrow Up/Down → also works to navigate the popup
--
-- Treesitter selection (visual mode, new in 0.12):
--   an / in → select outer/inner node   ]n / [n → grow/shrink
--
-- =============================================================================

local opts = { noremap = true, silent = true }

local function map(mode, keys, action, description)
	local options = vim.deepcopy(opts)
	if description then
		options.desc = description
	end
	vim.keymap.set(mode, keys, action, options)
end

-- =============================================================================
-- Built-in tools (Neovim 0.12)
-- =============================================================================
map("n", "<leader>u", "<cmd>Undotree<CR>", "Undo tree (built-in)")
map("n", "<leader>dt", function()
	vim.ui.input({ prompt = "DiffTool — compare with: " }, function(path)
		if path then
			vim.cmd("DiffTool " .. vim.fn.expand("%:h") .. " " .. path)
		end
	end)
end, "DiffTool (compare dirs)")

-- =============================================================================
-- Formatting (conform.nvim)
-- =============================================================================
map({ "n", "v" }, "<leader>gf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, "Format code")

map({ "n", "v" }, "<leader>mp", function()
	require("conform").format({
		lsp_format = "fallback",
		async = false,
		timeout_ms = 500,
	})
end, "Format file or range")

-- =============================================================================
-- Telescope
-- =============================================================================
local builtin = require("telescope.builtin")

local telescope_mappings = {
	-- File operations
	{ "<leader>ff", builtin.find_files, "Telescope find files" },
	{ "<leader>fg", builtin.live_grep, "Telescope live grep" },
	{ "<leader>fb", builtin.buffers, "Telescope buffers" },
	{ "<leader>fh", builtin.help_tags, "Telescope help tags" },
	{ "<leader>of", builtin.oldfiles, "Telescope previously open files" },
	{ "<leader>fe", "<cmd>Telescope file_browser<CR>", "Telescope file browser" },

	-- LSP via Telescope (nicer UI than the built-in quickfix output)
	-- Use these for browsing; use built-in gr* for quick one-shot actions
	{ "<leader>td", builtin.lsp_definitions, "Telescope definitions" },
	{ "<leader>ti", builtin.lsp_implementations, "Telescope implementations" },
	{ "<leader>tt", builtin.lsp_type_definitions, "Telescope type definitions" },
	{ "<leader>tr", builtin.lsp_references, "Telescope references" },
	{ "<leader>ts", builtin.lsp_document_symbols, "Telescope document symbols" },

	-- Diagnostics
	{ "<leader>da", builtin.diagnostics, "Telescope all diagnostics" },

	-- Utilities
	{ "<leader>ma", builtin.man_pages, "Telescope man pages" },
	{ "<leader>qf", builtin.quickfix, "Telescope quickfix list" },
	{ "<leader>sp", builtin.spell_suggest, "Telescope spelling suggestions" },
	{ "<leader>km", builtin.keymaps, "Telescope keymappings (includes built-in defaults)" },
}

for _, mapping in ipairs(telescope_mappings) do
	map("n", mapping[1], mapping[2], mapping[3])
end

map("n", "<leader>dc", function()
	builtin.diagnostics({ bufnr = 0 })
end, "Current buffer diagnostics")

-- =============================================================================
-- Neo-tree
-- =============================================================================
map("n", "<leader>e", "<cmd>Neotree toggle float<CR>", "Toggle Neotree filesystem")
map("n", "<leader>ef", "<cmd>Neotree reveal<CR>", "Find file in Neotree")

-- =============================================================================
-- Plugin management
-- =============================================================================
map("n", "<leader>pu", function()
	vim.pack.update({})
end, "Update plugins (vim.pack)")
