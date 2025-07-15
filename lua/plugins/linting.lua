return {
    {
        "mfussenegger/nvim-lint",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            local lint = require "lint"

            -- Configure linters by filetype
            lint.linters_by_ft = {
                python = { "flake8", "mypy" },
                javascript = { "eslint_d" },
                java = { "checkstyle" },
                c = { "cpplint" },
                cpp = { "cpplint" },
                -- lua = { "luacheck" }, -- Removed: lua_ls LSP already provides better diagnostics
                bash = { "shellcheck" },
                sh = { "shellcheck" },
                css = { "stylelint" },
                -- Note: Rust linting is typically handled by rust-analyzer LSP
                -- If you want additional Rust linting, you can use "bacon" from Mason directly
            }

            -- Create autocommand for linting
            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
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
                require("mason-nvim-lint").setup {
                    -- Ensure these linters are installed
                    ensure_installed = {
                        "flake8", -- Python
                        "mypy", -- Python type checking
                        "eslint_d", -- JavaScript
                        "checkstyle", -- Java
                        "cpplint", -- C/C++
                        "shellcheck", -- Bash/Shell scripts
                        "stylelint", -- CSS
                    },
                    -- Automatically install linters that are configured in nvim-lint
                    automatic_installation = true,
                    -- Disable warnings about misconfigurations
                    quiet_mode = false,
                }
            end, 1000) -- 1 second delay
        end,
    },
}
