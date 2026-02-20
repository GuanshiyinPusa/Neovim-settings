return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
        "saghen/blink.cmp", -- For seamless integration
    },
    opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
        disable_in_macro = false,
        disable_in_visualblock = false,
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
        enable_bracket_in_quote = true,
        enable_abbr = false,
        break_undo = true,
        check_ts = true,
        map_bs = true,
        map_c_h = false,
        map_c_w = false,
    },
    config = function(_, opts)
        local autopairs = require "nvim-autopairs"
        autopairs.setup(opts)

        -- Enhanced rules for better bracket handling
        local Rule = require "nvim-autopairs.rule"

        -- Add spaces in brackets for specific languages
        autopairs.add_rules {
            Rule(" ", " "):with_pair(function(opts)
                local pair = opts.line:sub(opts.col - 1, opts.col)
                return vim.tbl_contains({ "()", "[]", "{}" }, pair)
            end),
            Rule("( ", " )")
                :with_pair(function()
                    return false
                end)
                :with_move(function(opts)
                    return opts.prev_char:match ".%)" ~= nil
                end)
                :use_key ")",
            Rule("{ ", " }")
                :with_pair(function()
                    return false
                end)
                :with_move(function(opts)
                    return opts.prev_char:match ".%}" ~= nil
                end)
                :use_key "}",
            Rule("[ ", " ]")
                :with_pair(function()
                    return false
                end)
                :with_move(function(opts)
                    return opts.prev_char:match ".%]" ~= nil
                end)
                :use_key "]",
        }

        -- Language-specific rules
        -- HTML/JSX
        autopairs.add_rules {
            Rule("<!--", "-->", { "html", "xml" }),
        }

        -- Lua
        autopairs.add_rules {
            Rule(" then$", " end", "lua"):end_wise(function()
                return true
            end),
        }

        -- Python
        autopairs.add_rules {
            Rule('"""', '"""', "python"),
            Rule("'''", "'''", "python"),
        }

        -- NOTE: blink.cmp handles function brackets via its auto_brackets feature
        -- autopairs handles general quote/bracket pairs and language-specific rules
        -- They work together seamlessly
    end,
}
