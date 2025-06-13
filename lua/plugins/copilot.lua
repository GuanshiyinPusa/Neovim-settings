return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup {
                suggestion = { enabled = false },
                panel = { enabled = false },
            }
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        after = "nvim-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}
