return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require "conform"

            conform.setup {
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    javascript = { "prettier" },
                    css = { "prettier" },
                    java = { "google-java-format" },
                    bash = { "shfmt" },
                    sh = { "shfmt" },
                    rust = { "rustfmt" },
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
                },
            }
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
                require("mason-conform").setup {
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
                    automatic_installation = true,
                    -- Disable warnings about misconfigurations
                    quiet_mode = false,
                }
            end, 1500) -- 1.5 second delay (after mason-nvim-lint)
        end,
    },
}
