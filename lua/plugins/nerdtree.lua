-- Auto-start NERDTgg
-- Close NERDTree if it is the last buffer/window open
-- Below code will initialize Nerdtree when nvim is stareted
vim.cmd([[
    autocmd VimEnter * NERDTree | wincmd p
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    ]])
-- Add below line in vim.cmd([[]]) to initialize NERDTree when start.
--     autocmd VimEnter * NERDTree | wincmd p



-- autocmd VimEnter * rightbelow vsp | terminal
-- autocmd VimEnter * vertical resize 49
-- autocmd VimEnter * wincmd p


-- Ensure vim-devicons is working with NERDTree
vim.g.webdevicons_conceal_nerdtree_brackets = 1
vim.g.NERDTreeShowIcons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
vim.g.webdevicons_enable_nerdtree = 1

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    -- Check if NERDTree is open
    for _, win in pairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if string.find(buf_name, "NERD_tree") then
        -- Introduce a slight delay before refreshing NERDTree
        vim.defer_fn(function()
          vim.cmd("NERDTreeRefresh")
        end, 50) -- Delay in milliseconds
        break
      end
    end
  end
})
