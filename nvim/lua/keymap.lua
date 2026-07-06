-- Define options once
local opts = { noremap = true, silent = true }

-- Helper function to set keymaps with combined options
local function map(mode, lhs, rhs, description)
    local options = vim.deepcopy(opts)
    if description then
        options.desc = description
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- LSP keymap setup function (called from lspconfig on_attach)
local function setup_lsp_keymaps(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Definition and references
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)

    -- Diagnostics
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

    -- Code actions and hover
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    -- clangd-only extras (from clangd_extensions.nvim). Buffer-local so they
    -- only exist where clangd is attached (C/C++).
    if client and client.name == "clangd" then
        vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>",
            vim.tbl_extend("force", bufopts, { desc = "Switch source/header" }))
        vim.keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<cr>",
            vim.tbl_extend("force", bufopts, { desc = "clangd symbol info" }))
    end
end

-- Basic editor mappings
map("n", ";", ":", "CMD enter command mode")
map("i", "jk", "<ESC>", "Exit insert mode")

-- Diagnostics (global, works even without an LSP attached)
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic in a float")
map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

-- Formatting (conform.nvim)
map({ "n", "v" }, "<leader>gf", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, "Format code")

-- Linting (nvim-lint)
map("n", "<leader>gl", function()
    require("lint").try_lint()
end, "Trigger linting")


-- Telescope mappings
local builtin = require "telescope.builtin"
local telescope_mappings = {
    -- File operations
    { "<space>ff", builtin.find_files,           "Telescope find files" },
    { "<space>fg", builtin.live_grep,            "Telescope live grep" },
    { "<space>fb", builtin.buffers,              "Telescope buffers" },
    { "<space>fh", builtin.help_tags,            "Telescope help tags" },
    { "<space>of", builtin.oldfiles,             "Telescope lists previously open files" },

    -- LSP related
    { "<space>td", builtin.lsp_definitions,      "Telescope Go to definition" },
    { "<space>ti", builtin.lsp_implementations,  "Telescope Go to implementation" },
    { "<space>tt", builtin.lsp_type_definitions, "Telescope Go to type definition" },
    { "<space>tr", builtin.lsp_references,       "Telescope Find references" },

    -- Diagnostics
    { "<space>dd", builtin.diagnostics,          "Telescope All diagnostics" },

    -- Utilities
    { "<space>ma", builtin.man_pages,            "Telescope man page" },
    { "<space>qf", builtin.quickfix,             "Telescope lists items in the quickfix list" },
    {
        "<space>sp",
        builtin.spell_suggest,
        "Telescope lists spelling suggestions for the current word under the cursor",
    },
    { "<space>km", builtin.keymaps, "Telescope lists normal mode keymappings" },
}

-- Apply all telescope mappings
for _, mapping in ipairs(telescope_mappings) do
    map("n", mapping[1], mapping[2], mapping[3])
end

-- Function mappings that require special handling
map("n", "<space>dc", function()
    builtin.diagnostics { bufnr = 0 }
end, "Current buffer diagnostics")

-- Neotree
map("n", "<space>n", ":Neotree toggle float<CR>", "Toggle Neotree filesystem")

-- Formatting (conform.nvim)
map({ "n", "v" }, "<leader>mp", function()
    require("conform").format {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
    }
end, "Format file or range")

map({ "n", "v" }, "fa", function()
    require("conform").format {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
    }
end, "Format file or range")

-- Linting: avoid prefix collision with <space>lg (LazyGit)
map("n", "<space>ll", function()
    require("lint").try_lint()
end, "Trigger linting for current file")

-- LazyGit via snacks.nvim (already a dependency). Requires the `lazygit`
-- binary on PATH: `sudo pacman -S lazygit`. The old `:LazyGit` command did
-- not exist (no lazygit.nvim plugin installed), so this replaces a dead map.
map("n", "<space>lg", function()
    require("snacks").lazygit()
end, "Open LazyGit")

-- Comment toggle. Uses <leader>cc (not <leader>c) so it doesn't shadow the
-- <leader>ca code-action map with a timeout. Native `gcc`/`gc` also work.
map("n", "<leader>cc", "<cmd>normal! gcc<CR>", "Toggle line comment")

-- Quick fix list navigation
map("n", "[q", ":cprev<CR>", "Previous quickfix item")
map("n", "]q", ":cnext<CR>", "Next quickfix item")

-- Build & run the current C/C++ file in a terminal split (real interactive
-- stdin — unlike `:!./main`, which freezes on input and hides the hit-enter
-- prompt under noice). For debugging instead, use F5 (nvim-dap).
map("n", "<leader>rr", function()
    local ft = vim.bo.filetype
    if ft ~= "c" and ft ~= "cpp" then
        vim.notify("<leader>rr builds C/C++ files; current filetype is " .. ft, vim.log.levels.WARN)
        return
    end
    local src = vim.fn.expand("%:p")
    local out = vim.fn.fnamemodify(src, ":r")
    local compiler = ft == "cpp" and "g++" or "gcc"
    vim.cmd("silent! write")
    local cmd = string.format(
        "%s -g -O0 -Wall %s -o %s && %s",
        compiler,
        vim.fn.shellescape(src),
        vim.fn.shellescape(out),
        vim.fn.shellescape(out)
    )
    vim.cmd("botright split | resize 15 | terminal " .. cmd)
    vim.cmd("startinsert") -- ready to type program input immediately
end, "Build & run current C/C++ file")

-- ============================================================
--  Plugin keymaps
--  Centralised here instead of in each plugin's `keys = {}`.
--  The plugins still lazy-load via their `cmd`/`event`/`ft`
--  triggers (or a require() in the callbacks below).
-- ============================================================

-- Flash (folke/flash.nvim) — motion / jump
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, "Flash jump")
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, "Flash treesitter")
map("o", "r", function() require("flash").remote() end, "Remote flash")
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, "Treesitter search")
map("c", "<c-s>", function() require("flash").toggle() end, "Toggle flash search")

-- Debugging (mfussenegger/nvim-dap) — <leader>b group; F-keys for stepping
map("n", "<F5>", function() require("dap").continue() end, "Debug: Start/Continue")
map("n", "<F9>", function() require("dap").toggle_breakpoint() end, "Debug: Toggle breakpoint")
map("n", "<F10>", function() require("dap").step_over() end, "Debug: Step Over")
map("n", "<F11>", function() require("dap").step_into() end, "Debug: Step Into")
map("n", "<F12>", function() require("dap").step_out() end, "Debug: Step Out")
map("n", "<leader>bb", function() require("dap").toggle_breakpoint() end, "Toggle breakpoint")
map("n", "<leader>bB", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Conditional breakpoint")
map("n", "<leader>bc", function() require("dap").continue() end, "Continue")
map("n", "<leader>bi", function() require("dap").step_into() end, "Step into")
map("n", "<leader>bo", function() require("dap").step_over() end, "Step over")
map("n", "<leader>bO", function() require("dap").step_out() end, "Step out")
map("n", "<leader>br", function() require("dap").repl.toggle() end, "Toggle REPL")
map("n", "<leader>bl", function() require("dap").run_last() end, "Run last")
map("n", "<leader>bt", function() require("dap").terminate() end, "Terminate")
-- require("dap") first so nvim-dap's config runs (it calls dapui.setup()).
map("n", "<leader>bu", function()
    require("dap")
    require("dapui").toggle()
end, "Toggle DAP UI")
map({ "n", "v" }, "<leader>be", function()
    require("dap")
    require("dapui").eval()
end, "Eval expression")

-- Trouble (folke/trouble.nvim)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)")
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer diagnostics (Trouble)")
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)")
map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP defs/refs (Trouble)")
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", "Location list (Trouble)")
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", "Quickfix list (Trouble)")

-- Aerial (stevearc/aerial.nvim) — symbol outline
map("n", "<leader>oa", "<cmd>AerialToggle!<cr>", "Aerial outline")

-- Godbolt (p00f/godbolt.nvim) — assembly view
map("n", "<leader>mg", "<cmd>%Godbolt<cr>", "Godbolt assembly (buffer)")
map("v", "<leader>mg", ":Godbolt<cr>", "Godbolt assembly (selection)")

-- LeetCode (kawre/leetcode.nvim)
map("n", "<leader>ml", "<cmd>Leet<cr>", "LeetCode menu")

-- venv-selector (linux-cultist/venv-selector.nvim)
map("n", "<leader>mv", "<cmd>VenvSelect<cr>", "Select Python venv")

-- Diffview (sindrets/diffview.nvim)
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", "Diffview: open")
map("n", "<leader>gD", "<cmd>DiffviewClose<cr>", "Diffview: close")
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", "Diffview: current file history")
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", "Diffview: branch history")

-- todo-comments (folke/todo-comments.nvim)
map("n", "]t", function() require("todo-comments").jump_next() end, "Next todo comment")
map("n", "[t", function() require("todo-comments").jump_prev() end, "Previous todo comment")
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", "Find todos")
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", "Todos (Trouble)")

-- persistence (folke/persistence.nvim) — sessions
map("n", "<leader>os", function() require("persistence").load() end, "Restore session (cwd)")
map("n", "<leader>ol", function() require("persistence").load({ last = true }) end, "Restore last session")
map("n", "<leader>od", function() require("persistence").stop() end, "Stop saving session")

-- Oil (stevearc/oil.nvim)
map("n", "-", "<cmd>Oil<cr>", "Open parent directory (Oil)")

-- Undotree (mbbill/undotree)
map("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", "Undotree toggle")

-- Precognition (tris203/precognition.nvim)
map("n", "<leader>up", "<cmd>Precognition peek<cr>", "Precognition peek")
map("n", "<leader>uP", "<cmd>Precognition toggle<cr>", "Precognition toggle")

-- Hawtkeys (tris203/hawtkeys.nvim)
map("n", "<leader>uh", "<cmd>Hawtkeys<cr>", "Hawtkeys: suggest better keymaps")
map("n", "<leader>ud", "<cmd>HawtkeysDupes<cr>", "Hawtkeys: find duplicates")

-- smart-splits (mrjones2014/smart-splits.nvim) — also crosses into kitty windows
map("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, "Move to left split")
map("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, "Move to below split")
map("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, "Move to above split")
map("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, "Move to right split")
map("n", "<A-h>", function() require("smart-splits").resize_left() end, "Resize split left")
map("n", "<A-j>", function() require("smart-splits").resize_down() end, "Resize split down")
map("n", "<A-k>", function() require("smart-splits").resize_up() end, "Resize split up")
map("n", "<A-l>", function() require("smart-splits").resize_right() end, "Resize split right")

-- which-key (folke/which-key.nvim)
map("n", "<leader>?", function() require("which-key").show({ global = false }) end, "Buffer local keymaps")

-- Claude Code (coder/claudecode.nvim)
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", "Toggle Claude")
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", "Focus Claude")
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", "Resume Claude")
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", "Continue Claude")
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", "Select Claude model")
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", "Add current buffer")
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", "Send to Claude")
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", "Accept diff")
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", "Deny diff")
-- Claude: add file from a file-explorer buffer (buffer-local, filetype-specific)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
    callback = function(ev)
        vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",
            { buffer = ev.buf, silent = true, desc = "Add file to Claude" })
    end,
})

-- Export setup function
return {
    setup_lsp_keymaps = setup_lsp_keymaps,
}
