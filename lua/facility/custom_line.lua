
-- bread

Statusline = {}


local _au = vim.api.nvim_create_augroup('status_line', { clear = true })
vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
    pattern = "*",
    callback = function()
        vim.wo.statusline = Statusline.active()
    end,
    group = _au
})
vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
    pattern = "*",
    callback = function()
        vim.wo.statusline = Statusline.inactive()
    end,
    group = _au
})

local function MyStatusLine()
	return "Helllo"
end


Statusline.active = function()
  return table.concat {
    -- "%#Statusline#",
	MyStatusLine(),
    "%#Normal# ",
    "%#Normal#",
    "%=%#StatusLineExtra#",
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end


