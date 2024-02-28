require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "snyk_ls", "typos_lsp", "clangd", "lua_ls", "cmake",
        "bashls", "zls" },
    automatic_installation = true,
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                },
            },
        },
    },
}
require("lspconfig").clangd.setup {
    cmd = {
        "clangd",
        "--fallback-style=LLVM"
    }
}
require("lspconfig").pyright.setup {}
require("lspconfig").zls.setup {}

