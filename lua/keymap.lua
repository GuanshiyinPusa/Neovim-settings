local opts = { noremap = true, silent = true }

-- Paste on next line with p
vim.keymap.set("n", "p", ":put<CR>", opts)

-- Telescope
local builtin = require("telescope.builtin")
-- Keybindings for Telescope with descriptions
vim.keymap.set("n", "<space>ff", builtin.find_files, opts, { desc = "Find File" })
vim.keymap.set("n", "<space>fg", builtin.live_grep, opts, { desc = "Live Grep" })
vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end, opts, { desc = "File Browser" })

-- Neotree
vim.keymap.set("n", "<space>n", ":Neotree toggle float<CR>", opts, { desc = "Toggle Neotree filesystem" })
vim.keymap.set("n", "<space>s", ":Neotree toggle git_status float<CR>", opts, { desc = "Toggle Neotree git-status" })

-- Neogen
vim.keymap.set("n", "<Leader>cc", ":lua require('neogen').generate()<CR>", opts)

-- LSP
vim.keymap.set("n", "<F2>", vim.lsp.buf.hover, opts, { desc = "Hover Information" })
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to Definition" })
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
-- vim.keymap.set("n", "td", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- diagnostics and code actions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts, { desc = "Show Diagnostic" })
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts, { desc = "Code Action" })

-- Formatter
vim.keymap.set({ "n", "v" }, "fa", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
	})
end, { desc = "Format file or range" })

-- Linter
vim.keymap.set("n", "<space>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- LazyGit
vim.keymap.set("n", "<space>g", "<cmd>LazyGit<cr>", opts, { desc = "Open LazyGit" })

-- Copilot
vim.keymap.set(
	"n",
	"<space>cp",
	function()
		vim.g.copilot_enabled = not vim.g.copilot_enabled
		if vim.g.copilot_enabled then
			print("Copilot enabled")
		else
			print("Copilot disabled")
		end
	end,
	opts,
	{
		desc = "Toggle Copilot",
	}
)

-- Terminal
vim.api.nvim_set_keymap("n", "<Space>t", ":ToggleTerm direction=float<CR>", opts)
