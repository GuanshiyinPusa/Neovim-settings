require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map(
    "n",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { desc = "vim.lsp.buf.code_action()" }
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<space>z", function()
    require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })
