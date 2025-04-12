return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "c",
                "cpp",
                "python",
                "java",
            },
        },
    },
}
