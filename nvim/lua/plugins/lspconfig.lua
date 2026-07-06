return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				PATH = "prepend",
			})
		end,
	},
	{
		-- nvim-lspconfig ships the server definitions used by vim.lsp.config /
		-- vim.lsp.enable, and here it also owns diagnostics + the LspAttach
		-- keymaps. Loads before mason-lspconfig (which enables servers).
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Diagnostic signs
			local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Diagnostics display. Inline text is handled by
			-- tiny-inline-diagnostic.nvim, so native virtual_text/lines are off.
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = false,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})

			-- Attach our keymaps + inlay hints whenever ANY LSP client attaches.
			-- (Replaces the old on_attach path, which silently broke under
			-- mason-lspconfig v2 + Neovim's vim.lsp.config API.)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					require("keymap").setup_lsp_keymaps(client, ev.buf)
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig", -- must load first: provides server configs
			"saghen/blink.cmp", -- for LSP capabilities
		},
		config = function()
			-- Completion capabilities from blink.cmp, applied to every server.
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			-- Per-server overrides (Neovim 0.11+ vim.lsp.config API). These are
			-- merged onto nvim-lspconfig's built-in defaults for each server.
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders=false",
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								vim.fn.stdpath("config"),
								"${3rd}/luv/library",
							},
						},
						completion = { callSnippet = "Replace", keywordSnippet = "Replace" },
						diagnostics = {
							globals = { "vim", "describe", "it", "before_each", "after_each" },
							disable = { "missing-fields" },
						},
						hint = { enable = true },
						format = { enable = false }, -- stylua handles formatting
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoImportCompletions = true,
						},
					},
				},
			})

			-- Install the listed servers, then auto-enable every installed one
			-- via vim.lsp.enable (mason-lspconfig v2 default behaviour).
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright", -- Python
					"html", -- HTML
					"cssls", -- CSS
					"jdtls", -- Java
					"clangd", -- C/C++
					"lua_ls", -- Lua
					"ts_ls", -- TypeScript/JavaScript
					"rust_analyzer", -- Rust
					"cobol_ls", -- Cobol
				},
				automatic_enable = true,
			})
		end,
	},
}
