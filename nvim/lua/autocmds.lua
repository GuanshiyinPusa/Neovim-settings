-- Copyright header insertion
--
-- cpplint's `legal/copyright` check wants a line containing "Copyright" within
-- the first 10 lines of every C/C++ file. This inserts one automatically:
--   * on new .c/.cc/.cpp/.h/.hpp files (BufNewFile)
--   * on demand via :AddCopyright for existing files
--
-- Change COPYRIGHT_OWNER to your name or company.
local COPYRIGHT_OWNER = "Shuyuan Gao"

local function copyright_line()
    return string.format("// Copyright %s %s. All rights reserved.", os.date("%Y"), COPYRIGHT_OWNER)
end

-- Insert the header at the top of the current buffer, unless one already exists.
local function add_copyright(bufnr)
    bufnr = bufnr or 0
    local first_lines = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)
    for _, line in ipairs(first_lines) do
        if line:match("[Cc]opyright") then
            return -- already present, don't duplicate
        end
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { copyright_line(), "" })
end

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.c", "*.cc", "*.cpp", "*.cxx", "*.h", "*.hpp", "*.hh" },
    callback = function(args)
        add_copyright(args.buf)
    end,
    desc = "Insert copyright header into new C/C++ files",
})

vim.api.nvim_create_user_command("AddCopyright", function()
    add_copyright(0)
end, { desc = "Insert a copyright header at the top of the current file" })
