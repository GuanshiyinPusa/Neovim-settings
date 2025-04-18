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
        opts = function(_, opts)
            -- Get NVChad's original cmp config
            local nvchad_cmp = require("nvchad.cmp")

            -- Only modify what we need to change
            local new_sources = vim.tbl_deep_extend("force", opts.sources or {}, {
                { name = "copilot", group_index = 2 },
            })

            return vim.tbl_deep_extend("force", opts, nvchad_cmp or {}, {
                sources = new_sources,
            })
        end,
    },
}
