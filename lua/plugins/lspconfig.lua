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
                ensure_installed = {
                    "pyright",       -- Python
                    "html",          -- HTML
                    "cssls",         -- CSS
                    "jdtls",         -- Java
                    "clangd",        -- C/C++
                    "lua_ls",        -- Lua
                    "ts_ls",         -- TypeScript/JavaScript
                    "rust_analyzer", -- Rust
                },
                automatic_installation = false,
            }

            -- Configure servers. Prefer mason-lspconfig.setup_handlers when available,
            -- otherwise fall back to manual configuration for compatibility.
            local mlsp = require("mason-lspconfig")

            if type(mlsp.setup_handlers) == "function" then
                mlsp.setup_handlers({
                    -- Default handler for all servers
                    function(server_name)
                        vim.lsp.config[server_name].setup {
                            capabilities = capabilities,
                            on_attach = _G.on_lsp_attach,
                        }
                    end,

                    -- Custom configurations for specific servers
                    ["lua_ls"] = function()
                        vim.lsp.config.lua_ls.setup {
                            capabilities = capabilities,
                            on_attach = _G.on_lsp_attach,
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
                        vim.lsp.config.clangd.setup {
                            capabilities = capabilities,
                            on_attach = _G.on_lsp_attach,
                            cmd = {
                                "clangd",
                                "--offset-encoding=utf-16",
                                "--background-index",
                                "--clang-tidy",
                                "--header-insertion=iwyu",
                                "--completion-style=detailed",
                                "--function-arg-placeholders=false",
                            },
                        }
                    end,

                    ["pyright"] = function()
                        vim.lsp.config.pyright.setup {
                            capabilities = capabilities,
                            on_attach = _G.on_lsp_attach,
                            settings = {
                                python = {
                                    analysis = {
                                        typeCheckingMode = "basic",
                                        autoImportCompletions = true,
                                    },
                                },
                            },
                        }
                    end,
                })
                -- Central installer for linters/formatters (sequential, avoid races)
                vim.defer_fn(function()
                    local ok, registry = pcall(require, "mason-registry")
                    if not ok or not registry then
                        return
                    end

                    local pkgs = {
                        "flake8", "mypy", "eslint_d", "checkstyle", "cpplint", "shellcheck", "stylelint",
                        "stylua", "isort", "black", "clang-format", "prettier", "google-java-format", "shfmt", "rustfmt",
                    }

                    for _, name in ipairs(pkgs) do
                        local has = registry.has_package and registry.has_package(name)
                        if not has then goto continue end
                        local ok2, pkg = pcall(registry.get_package, name)
                        if not ok2 or not pkg then goto continue end

                        if pkg:is_installed() then goto continue end

                        if pkg:is_installing() then
                            while pkg:is_installing() do
                                vim.wait(100)
                            end
                            goto continue
                        end

                        local started, err = pcall(function()
                            pkg:install()
                        end)
                        if not started then
                            vim.schedule(function()
                                vim.notify("mason: failed to start install for " .. name .. ": " .. tostring(err),
                                    vim.log.levels.WARN)
                            end)
                        else
                            while pkg:is_installing() do
                                vim.wait(100)
                            end
                        end
                        ::continue::
                    end
                end, 2000)
            else
                -- Fallback: configure known servers manually
                local servers = {
                    "pyright",
                    "html",
                    "cssls",
                    "jdtls",
                    "clangd",
                    "lua_ls",
                    "ts_ls",
                    "rust_analyzer",
                }

                for _, server_name in ipairs(servers) do
                    local cfg = { capabilities = capabilities, on_attach = _G.on_lsp_attach }

                    if server_name == "lua_ls" then
                        cfg.settings = {
                            Lua = {
                                runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
                                workspace = {
                                    checkThirdParty = false,
                                    library = { vim.env.VIMRUNTIME, vim.fn.stdpath "config" },
                                    maxPreload = 100000,
                                    preloadFileSize = 10000,
                                },
                                completion = { callSnippet = "Replace", keywordSnippet = "Replace" },
                                diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
                                format = { enable = false },
                                telemetry = { enable = false },
                            },
                        }
                    elseif server_name == "clangd" then
                        cfg.cmd = {
                            "clangd",
                            "--offset-encoding=utf-16",
                            "--background-index",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                            "--completion-style=detailed",
                            "--function-arg-placeholders=false",
                        }
                    elseif server_name == "pyright" then
                        cfg.settings = { python = { analysis = { typeCheckingMode = "basic", autoImportCompletions = true } } }
                    end

                    pcall(function()
                        vim.lsp.config[server_name].setup(cfg)
                    end)
                end
            end
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

            -- LSP keymaps are managed from keymap.lua
            _G.on_lsp_attach = function(client, bufnr)
                -- Load and apply LSP keymaps from keymap module
                require("keymap").setup_lsp_keymaps(client, bufnr)

                -- Enable inlay hints for Neovim 0.10+
                if client and client.supports_method "textDocument/inlayHint" then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end

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
