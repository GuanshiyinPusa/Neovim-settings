return {
    {
        "williamboman/mason.nvim",
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
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "saghen/blink.cmp", -- For LSP capabilities
        },
        config = function()
            -- Get capabilities from blink.cmp
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("mason-lspconfig").setup {
                ensure_installed = { "pyright", "html", "cssls", "jdtls", "clangd", "lua_ls" },
                automatic_installation = true,
            }

            -- Use setup_handlers (mason-lspconfig API) to configure servers.
            require("mason-lspconfig").setup_handlers({
                -- Default handler for all servers
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

                -- Custom configurations for specific servers
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                    path = vim.split(package.path, ";"),
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        vim.fn.stdpath "config",
                                        "${3rd}/luv/library",
                                        "${3rd}/busted/library",
                                    },
                                    maxPreload = 100000,
                                    preloadFileSize = 10000,
                                },
                                completion = {
                                    callSnippet = "Replace",
                                    keywordSnippet = "Replace",
                                },
                                diagnostics = {
                                    globals = {
                                        "vim",
                                        "describe",
                                        "it",
                                        "before_each",
                                        "after_each",
                                    },
                                    disable = { "missing-fields" },
                                },
                                hint = {
                                    enable = true,
                                    arrayIndex = "Disable",
                                    await = true,
                                    paramName = "Disable",
                                    paramType = true,
                                    semicolon = "Disable",
                                    setType = false,
                                },
                                format = {
                                    enable = false, -- Use stylua instead
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    }
                end,

                ["clangd"] = function()
                    require("lspconfig").clangd.setup {
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--offset-encoding=utf-16",
                            "--background-index",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                            "--completion-style=detailed",
                            "--function-arg-placeholders",
                        },
                    }
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- Setup diagnostic signs
            local signs = {
                Error = "",
                Warn = "",
                Hint = "󰌵",
                Info = "",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Configure diagnostics
            vim.diagnostic.config {
                virtual_text = {
                    prefix = "●",
                },
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }

            -- Configure inlay hints (Neovim 0.10+)
            if vim.fn.has "nvim-0.10" == 1 then
                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("lsp_attach_inlay_hints", { clear = true }),
                    callback = function(event)
                        local client = vim.lsp.get_client_by_id(event.data.client_id)
                        if client and client.supports_method "textDocument/inlayHint" then
                            -- Enable inlay hints for this buffer
                            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
                        end
                    end,
                })
            end
        end,
    },
}
