
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

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  ["VB"] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end




Statusline.active = function()
  return table.concat {
    -- "%#Statusline#",
	MyStatusLine(),
	mode(),
    "%#Normal# ",
    "%#Normal#",
    "%=%#StatusLineExtra#",
  }
end

function Statusline.inactive()
  return " %F"
end

-- function Statusline.short()
--   return "%#StatusLineNC#   NvimTree"
-- end


