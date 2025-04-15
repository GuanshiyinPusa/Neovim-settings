return {
    -- Standalone Copilot configuration
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },

    -- nvim-cmp with Copilot integration
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end,
        },
        opts = {
            sources = {
                { name = "copilot", group_index = 2 },
                { name = "nvim_lsp", group_index = 2 },
                { name = "luasnip", group_index = 2 },
                { name = "buffer", group_index = 2 },
                { name = "nvim_lua", group_index = 2 },
                { name = "path", group_index = 2 },
            },
        },
    },
}
