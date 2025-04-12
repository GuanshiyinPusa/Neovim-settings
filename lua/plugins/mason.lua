return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "clang-format",
            "clangd",
            "lua_ls",
            "pyright",
            "jdtls",
            "html",
            "cssls",
        },
    },
}
