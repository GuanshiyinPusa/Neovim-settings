require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "c_sharp", "cmake", "cpp", "python", "rust", "zig" },
    auto_install = true,
    highlight = {
        enable = true,
    },
})
