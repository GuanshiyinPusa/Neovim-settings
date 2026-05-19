-- =============================================================================
-- LSP Configuration — Neovim 0.12
-- =============================================================================

-- Server overrides (only when you need custom settings)

-- Lua — configured for Neovim development
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})

-- C/C++
vim.lsp.config("clangd", {
	init_options = {
		fallbackFlags = { "--std=c23" },
	},
})

-- Enable servers
vim.lsp.enable({
	"lua_ls",
	"clangd",
	"pyright",
})

-- LspAttach — runs when a server attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local buf = ev.buf

		if not client then
			return
		end

		-- Enable built-in completion
		-- NOTE: use colon syntax client:supports_method() not dot syntax
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
		end

		-- Extra keymaps beyond built-in defaults
		local bufopts = { noremap = true, silent = true, buffer = buf }

		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)

		-- Toggle inlay hints
		if client:supports_method("textDocument/inlayHint") then
			vim.keymap.set("n", "<leader>li", function()
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
			end, { buffer = buf, desc = "LSP: Toggle inlay hints" })
		end

		-- Highlight symbol under cursor
		if client:supports_method("textDocument/documentHighlight") then
			local hl_group = vim.api.nvim_create_augroup("user_lsp_highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = buf,
				group = hl_group,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = buf,
				group = hl_group,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
