return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					json = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					yaml = { "prettier" },
					java = { "google-java-format" },
					bash = { "shfmt" },
					sh = { "shfmt" },
					rust = { "rustfmt" },
					markdown = { "prettier" },
				},
				-- Set up format-on-save
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
				-- Customize formatters
				formatters = {
					shfmt = {
						prepend_args = { "-i", "2" },
					},
					black = {
						prepend_args = { "--fast" },
					},
					prettier = {
						prepend_args = { "--prose-wrap=always" },
					},
				},
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		config = function()
			-- Add delay to prevent race conditions with other mason plugins
			vim.defer_fn(function()
				local ok, err = pcall(function()
					require("mason-conform").setup({
						-- Ensure these formatters are installed
						ensure_installed = {
							"stylua", -- Lua
							"isort", -- Python imports
							"black", -- Python
							"clang-format", -- C/C++
							"prettier", -- JavaScript/CSS
							"google-java-format", -- Java
							"shfmt", -- Bash/Shell
							"rustfmt", -- Rust
						},
						-- Automatically install formatters that are configured in conform.nvim
						automatic_installation = false,
						-- Disable warnings about misconfigurations
						quiet_mode = false,
					})
				end)
				if not ok then
					vim.schedule(function()
						vim.notify(
							"mason-conform setup: suppressed install conflict: " .. tostring(err),
							vim.log.levels.WARN
						)
					end)
				end
			end, 2500) -- 2.5 second delay (stagger after mason-nvim-lint)
		end,
	},
}
