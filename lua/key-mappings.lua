-- LSP Key Mappings
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>fa', vim.lsp.buf.format, {})


-- NERDTree Key Mapping
vim.keymap.set('n', '<Leader>fe', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Terminal Key Mapping
vim.keymap.set('n', '<Leader>te', ':bot split | terminal<CR>', { noremap = true, silent = true })

-- Display Diagnosis
vim.api.nvim_set_keymap('n', '<Leader>da', '<cmd>Telescope diagnostics<CR>', {noremap = true, silent = true})
