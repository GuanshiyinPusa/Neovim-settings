return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets", -- Collection of snippets for various languages
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"

        -- Load friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            window = {
                completion = {
                    max_height = 10, -- Limit popup height to 10 items
                    -- max_width = 50, -- Limit popup width
                },
                documentation = {
                    max_height = 15,
                    max_width = 60,
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                -- ["<C-p>"] = cmp.mapping.select_prev_item(),
                -- ["<C-n>"] = cmp.mapping.select_next_item(),
                -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- ["<C-Space>"] = cmp.mapping.complete(),
                -- ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            sources = cmp.config.sources {
                { name = "copilot", group_index = 2, max_item_count = 5 },
                { name = "nvim_lsp", group_index = 1, max_item_count = 8 },
                { name = "luasnip", group_index = 1, max_item_count = 5 },
                { name = "buffer", group_index = 3, max_item_count = 5 },
                { name = "nvim_lua", group_index = 3, max_item_count = 5 },
                { name = "path", group_index = 2, max_item_count = 5 },
            },
        }
    end,
}
