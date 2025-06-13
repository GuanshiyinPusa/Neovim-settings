return {
    {
        "mason-org/mason.nvim",
        -- event = "VeryLazy",
        config = function()
            require("mason").setup {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
                PATH = "prepend",
            }
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        -- event = "VeryLazy",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "pyright", "html", "cssls", "jdtls", "clangd" },
                automatic_installation = true,
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        -- event = "BufReadPre",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            -- Enable LSP servers using Neovim 0.11+ API
            local servers = { "html", "cssls", "pyright", "jdtls" }
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end

            -- Special configuration for clangd
            vim.lsp.enable("clangd", {
                cmd = { "clangd", "--offset-encoding=utf-16", "--background-index", "--clang-tidy" },
            })
        end,
    },
}
