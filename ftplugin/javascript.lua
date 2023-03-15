vim.keymap.set("n","<leader>;",function()
    -- save cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    -- append ,
    vim.cmd.normal("A;")
    -- restore cursor position
    vim.api.nvim_win_set_cursor(0, cursor)
end)
