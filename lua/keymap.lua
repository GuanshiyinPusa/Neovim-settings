-- Telescope
local builtin = require("telescope.builtin")
-- Keybindings for Telescope with descriptions
vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end, { desc = "File Browser" })

-- Neotree
vim.keymap.set("n", "<space>n", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neotree" })

-- LSP
vim.keymap.set("n", "<space>w", vim.lsp.buf.hover, { desc = "Hover Information" })
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
vim.keymap.set("n", "<space>fa", function()
	vim.lsp.buf.format({ async = true })
end, { silent = true, desc = "Format Code" })

-- DAP (Debug Adapter Protocol)
vim.keymap.set("n", "<space>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<space>dc", function()
	require("dap").continue()
end, { desc = "Continue Debugging" })

vim.keymap.set("n", "<space>dd", function()
	require("dap").disconnect()
end, { desc = "End Debug Session" })

vim.keymap.set("n", "<space>de", function()
	require("dapui").close()
end, { desc = "Close DAP UI" })

-- Git
vim.keymap.set("n", "<space>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
vim.keymap.set("n", "<space>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Blame" })

-- MarkdownPreview
vim.keymap.set("n", "<space>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true, desc = "Preview Markdown" })

-- Comment
local api = require("Comment.api")
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

-- Toggle selection (blockwise)
vim.keymap.set("x", "<C-\\>", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.toggle.blockwise(vim.fn.visualmode())
end, { desc = "Toggle Blockwise Comment" })

-- ZenMode
vim.keymap.set("n", "<space>z", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })
