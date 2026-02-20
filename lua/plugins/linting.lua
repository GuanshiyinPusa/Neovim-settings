return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			-- Configure linters by filetype
			lint.linters_by_ft = {
				python = { "flake8", "mypy" },
				java = { "checkstyle" },
				c = { "cpplint" },
				cpp = { "cpplint" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				css = { "stylelint" },
				-- Note: Rust linting is typically handled by rust-analyzer LSP
				-- If you want additional Rust linting, you can use "bacon" from Mason directly
			}

			-- Create autocommand for linting
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		config = function()
			-- Add delay to prevent race conditions with other mason plugins
			vim.defer_fn(function()
				local ok, err = pcall(function()
					require("mason-nvim-lint").setup({
						-- Ensure these linters are installed
						ensure_installed = {
							"flake8", -- Python
							"mypy", -- Python type checking
							"eslint_d", -- JavaScript/TypeScript
							"checkstyle", -- Java
							"cpplint", -- C/C++
							"shellcheck", -- Bash/Shell scripts
							"stylelint", -- CSS
						},
						-- Automatically install linters that are configured in nvim-lint
						automatic_installation = false,
						-- Disable warnings about misconfigurations
						quiet_mode = false,
					})
				end)
				if not ok then
					vim.schedule(function()
						vim.notify(
							"mason-nvim-lint setup: suppressed install conflict: " .. tostring(err),
							vim.log.levels.WARN
						)
					end)
				end
			end, 1500) -- 1.5 second delay (increased to reduce race)
		end,
	},
}
