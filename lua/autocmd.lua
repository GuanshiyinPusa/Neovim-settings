-- Auto Open Neotree and move cursor back to main window
vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true)
		end
		-- whatever other lsp config you want
	end,
})

--# Save session on exit
--[[ vim.api.nvim_create_autocmd("VimLeavePre", {
	pattern = "*",
	callback = function()
		if vim.g.savesession then
			vim.api.nvim_command("mks!")
		end
	end,
}) ]]
-- # Auto Open Neotree and move cursor back to main window
-- vim.api.nvim_create_autocmd("VimEnter", {
--     desc = "Open NeoTree on enter and move cursor back to main window",
--     group = "neotree_autoopen",
--     callback = function()
--         if not vim.g.neotree_opened then
--             -- Capture the current window ID before opening NeoTree
--             local current_win = vim.api.nvim_get_current_win()
--
--             -- Open NeoTree
--             vim.cmd("Neotree show")
--             vim.g.neotree_opened = true
--
--             -- Set the focus back to the original window
--             vim.api.nvim_set_current_win(current_win)
--         end
--     end,
-- })
