return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter.configs").setup {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "cpp", "lua", "python" },

            -- Install parsers synchronously (only applies to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true, -- Enables treesitter-based syntax highlighting
            },
        }
    end,
}
