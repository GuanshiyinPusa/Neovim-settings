-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>ff", builtin.find_files, {})
vim.keymap.set("n", "<space>fg", builtin.live_grep, {})

-- Neotree
vim.keymap.set("n", "<space>n", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- LSP
vim.keymap.set("n", "<space>w", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "td", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
-- diagnostics and code actions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})

-- Formatter
vim.keymap.set("n", "<space>fa", function()
    vim.lsp.buf.format({ async = true })
end, { silent = true })

-- DAP
-- Set a breakpoint with <leader>db
vim.keymap.set("n", "<space>db", function()
    require("dap").toggle_breakpoint()
end)

-- Start or continue debugging with <leader>dr
vim.keymap.set("n", "<space>dc", function()
    require("dap").continue()
end)

-- End session
vim.keymap.set("n", "<space>de", function()
    require("dap").terminate()
end)

-- Git
vim.keymap.set("n", "<space>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<space>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- MarkdownPreview
vim.keymap.set("n", "<space>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })

-- Comment
local api = require("Comment.api")
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
-- Toggle selection (linewise)
vim.keymap.set("x", "<C-_>", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode())
end)

-- Toggle selection (blockwise)
vim.keymap.set("x", "<C-\\>", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.blockwise(vim.fn.visualmode())
end)
