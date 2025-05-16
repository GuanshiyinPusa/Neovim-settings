return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup {
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signs_staged = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signs_staged_enable = true,
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },

            -- Keymaps (commented out for future reference)
            -- on_attach = function(bufnr)
            --   local gs = package.loaded.gitsigns
            --
            --   -- Navigation
            --   vim.keymap.set('n', ']c', function()
            --     if vim.wo.diff then return ']c' end
            --     vim.schedule(function() gs.next_hunk() end)
            --     return '<Ignore>'
            --   end, {expr=true, buffer=bufnr, desc="Next git hunk"})
            --
            --   vim.keymap.set('n', '[c', function()
            --     if vim.wo.diff then return '[c' end
            --     vim.schedule(function() gs.prev_hunk() end)
            --     return '<Ignore>'
            --   end, {expr=true, buffer=bufnr, desc="Previous git hunk"})
            --
            --   -- Actions
            --   vim.keymap.set({'n', 'v'}, '<leader>hs', gs.stage_hunk, {buffer=bufnr, desc="Stage hunk"})
            --   vim.keymap.set({'n', 'v'}, '<leader>hr', gs.reset_hunk, {buffer=bufnr, desc="Reset hunk"})
            --   vim.keymap.set('n', '<leader>hS', gs.stage_buffer, {buffer=bufnr, desc="Stage buffer"})
            --   vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, {buffer=bufnr, desc="Undo stage hunk"})
            --   vim.keymap.set('n', '<leader>hR', gs.reset_buffer, {buffer=bufnr, desc="Reset buffer"})
            --   vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer=bufnr, desc="Preview hunk"})
            --   vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, {buffer=bufnr, desc="Blame line"})
            --   vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, {buffer=bufnr, desc="Toggle blame line"})
            --   vim.keymap.set('n', '<leader>hd', gs.diffthis, {buffer=bufnr, desc="Diff this"})
            --   vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, {buffer=bufnr, desc="Diff against last commit"})
            --   vim.keymap.set('n', '<leader>td', gs.toggle_deleted, {buffer=bufnr, desc="Toggle deleted"})
            --
            --   -- Text object
            --   vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {buffer=bufnr, desc="Select hunk"})
            -- end
        }

        -- Add custom highlights for gitsigns (optional)
        -- vim.api.nvim_create_autocmd("ColorScheme", {
        --   callback = function()
        --     -- You can customize colors here if needed
        --     -- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#98c379" })
        --   end,
        -- })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
