return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy", -- Keep lazy loading
        config = function()
            require("mason").setup {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
                PATH = "prepend", -- Important for path management
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy", -- Keep lazy loading
        dependencies = {
            "williamboman/mason.nvim", -- Ensures mason loads first
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
        event = "BufReadPre", -- This triggers when you open a file
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim", -- Ensures mason loads before lspconfig
            "williamboman/mason-lspconfig.nvim", -- Ensures mason-lspconfig loads before lspconfig
        },
        config = function()
            -- First ensure mason is initialized
            require "mason"
            -- Then ensure mason-lspconfig is initialized
            require "mason-lspconfig"

            -- Now set up LSP
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require "lspconfig"
            -- 配置服务器
            local servers = { "html", "cssls", "pyright", "jdtls" }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end
            lspconfig.clangd.setup {
                cmd = { "clangd", "--offset-encoding=utf-16", "--background-index", "--clang-tidy" },
                capabilities = capabilities,
            }
        end,
    },
}
