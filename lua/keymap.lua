-- Telescope
local builtin = require("telescope.builtin")
-- Keybindings for Telescope with descriptions
vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end, { desc = "File Browser" })

-- LSP
vim.keymap.set("n", "<F2>", vim.lsp.buf.hover, { desc = "Hover Information" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
vim.keymap.set("n", "td", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- diagnostics and code actions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Formatter
vim.keymap.set({ "n", "v" }, "fa", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
	})
end, { desc = "Format file or range (in visual mode)" })

-- Linter
vim.keymap.set("n", "<space>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- ZenMode
vim.keymap.set("n", "<space>z", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })
