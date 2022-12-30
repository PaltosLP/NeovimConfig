-- local M = {}



local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local round_symbols = { " ", " "}

local TablineBufnr = {
    provider = function(self)
        return tostring(self.bufnr) .. ". "
    end,
    hl = { fg = "black" },
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local TablineFileName = {
    provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
    hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = false, fg = "black" }
    end,
}

-- this looks exactly like the FileFlags component that we saw in
-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
-- also, we are adding a nice icon for terminal buffers.
local TablineFileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = "[+]",
        hl = { fg = "green" },
    },
    {
        condition = function(self)
            return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
                or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
            if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
                return "  "
            else
                return " "
            end
        end,
        hl = { fg = "orange" },
    },
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    hl = function(self)
        if self.is_active then
            return "TabLineSel"
        -- why not?
        -- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
        --     return { fg = "gray" }
        else
            return "TabLine"
        end
    end,
    on_click = {
        callback = function(_, minwid, _, button)
            if (button == "m") then -- close on mouse middle click
                vim.api.nvim_buf_delete(minwid, {force = false})
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
    },
    TablineBufnr,
    -- FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
    TablineFileName,
    TablineFileFlags,
}

-- a nice "x" button to close the buffer
local TablineCloseButton = {
    condition = function(self)
        return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
    end,
    { provider = " " },
    {
        provider = " ",
        hl = { fg = "black" },
        on_click = {
            callback = function(_, minwid)
                vim.api.nvim_buf_delete(minwid, { force = false })
            end,
            minwid = function(self)
                return self.bufnr
            end,
            name = "heirline_tabline_close_buffer_callback",
        },
    },
}

-- The final touch!
--      
-- local symbols = { " ", " "}
-- local symbols = { "  ", " "   }
local symbols = { "", "" }
-- local symbols = { " ", " "}
local TablineBufferBlock = utils.surround(symbols, function(self)
    if self.is_active then
        return utils.get_highlight("TabLineSel").bg
    else
        return utils.get_highlight("TabLine").bg
    end
end, { TablineFileNameBlock, TablineCloseButton })

-- and here we go
local BufferLine = utils.make_buflist(
    TablineBufferBlock,
    { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
    { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
    -- by the way, open a lot of buffers and try clicking them ;)
)

----------------------------------------------------------------------------------------------
local TablinePicker = {
    condition = function(self)
        return self._show_picker
    end,
    init = function(self)
        local bufname = vim.api.nvim_buf_get_name(self.bufnr)
        bufname = vim.fn.fnamemodify(bufname, ":t")
        local label = bufname:sub(1, 1)
        local i = 2
        while self._picker_labels[label] do
            if i > #bufname then
                break
            end
            label = bufname:sub(i, i)
            i = i + 1
        end
        self._picker_labels[label] = self.bufnr
        self.label = label
    end,
    provider = function(self)
        return self.label
    end,
    hl = { fg = "red", bold = true },
}

vim.keymap.set("n", "gbp", function()
    local tabline = require("heirline").tabline
    local buflist = tabline._buflist[1]
    buflist._picker_labels = {}
    buflist._show_picker = true
    vim.cmd.redrawtabline()
    local char = vim.fn.getcharstr()
    local bufnr = buflist._picker_labels[char]
    if bufnr then
        vim.api.nvim_win_set_buf(0, bufnr)
    end
    buflist._show_picker = false
    vim.cmd.redrawtabline()
end)

---------------------------------------------------------------------------------------------

local Tabpage = {
    provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
    end,
    hl = function(self)
        if not self.is_active then
            return "TabLine"
        else
            return "TabLineSel"
        end
    end,
}

local TabpageClose = {
    provider = "%999X  %X",
    hl = "TabLine",
}

local TabPages = {
    -- only show this component if there's 2 or more tabpages
    condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
    end,
    { provider = "%=" },
    utils.make_tablist(Tabpage),
    TabpageClose,
}


---------------------------------------------------------------------------------------------

local TabLineOffset = {
    condition = function(self)
        local win = vim.api.nvim_tabpage_list_wins(0)[1]
        local bufnr = vim.api.nvim_win_get_buf(win)
        self.winid = win

        if vim.bo[bufnr].filetype == "NvimTree" then
            self.title = "NvimTree"
            return true
        -- elseif vim.bo[bufnr].filetype == "TagBar" then
        --     ...
        end
    end,

    provider = function(self)
        local title = self.title
        local width = vim.api.nvim_win_get_width(self.winid)
        local pad = math.ceil((width - #title) / 2)
        return string.rep(" ", pad) .. title .. string.rep(" ", pad)
    end,

    hl = function(self)
        -- local win = vim.api.nvim_tabpage_list_wins(0)[1]
        -- local bufnr = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_get_current_win() == self.winid then
            return "TablineSel"
		-- elseif vim.bo[bufnr].filetype == "NvimTree" then
  --           return { fg = "bright_yellow", bold = true, bg = "comment" }
  --           gotta be checked first
        else
            return "Tabline"
        end
    end,
}


---------------------------------------------------------------------------------------------
local tests = {

    provider = function()
		return "hi my name is"
    end,

    hl = function()
		return "TabLine"
    end,
}

local seperate = {
    { provider = '%='} -- this means that the statusline is cut here when there's not enough space
}


---------------------------------------------------------------------------------------------
local run = {

    provider  = function()
		return " "
        -- return " "     
    end,
    hl = { fg = "black", bg = "red", bold = true },
	on_click = {
        callback = function()
			vim.cmd('call run_file#Run_File()')
		    end,
        name = "LspInfo",
    }
}

local Run = utils.surround(round_symbols, "red", run)
---------------------------------------------------------------------------------------------
local lsp_active = {
    -- condition = conditions.lsp_attached,
    update = {'LspAttach', 'LspDetach'},

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for _, server in pairs(vim.lsp.buf_get_clients(0)) do
            table.insert(names, server.name)
        end
        return "   " .. table.concat(names, " ")
    end,
    hl = { fg = "black", bg = "green", bold = true },
	-- hl = function()
 --            return "Tabline"
 --        end,
	on_click = {
        callback = function()
			vim.cmd('LspInfo')
		    end,
        name = "LspInfo",
    }
}
if not conditions.lsp_attached then
	lsp_active = {
		provider = "No LangServer",
	    hl = { fg = "black", bg = "green", bold = true },
	}
end

local LSPActive = utils.surround(round_symbols, "green", lsp_active)
---------------------------------------------------------------------------------------------
local battery_icons = { " ", " ", " "," ", " ", " ", " ", " ", " " }
-- local charging_battery_icons = { " ", " ", " ", " ", " ", " ", " "}
local charging_battery_icons = { " ", " " }
local own_utils = require('ui.utils')
-- print(own_utils.is_charging())
local want_capa = true
local battery = {
	init = function(self)
		self.capacity = tonumber(own_utils.read_file("/sys/class/power_supply/battery/capacity"))
		self.is_charging = own_utils.is_charging()

	end,
    provider = function(self)
		local capa = math.floor(tonumber(self.capacity)/10)


		if self.is_charging then
			if self.capacity == 0 then
				want_capa = false
				return charging_battery_icons[2]
			else
				return charging_battery_icons[1] .. tostring(self.capacity)
			end
		end

		return battery_icons[capa] .. tostring(self.capacity)
    end,

    hl = { fg = "black", bg = "white", bold=true }
}
local Battery = utils.surround(round_symbols, "white", battery)
-- local TablineBufferBlock = utils.surround(symbols, function(self)
---------------------------------------------------------------------------------------------

local TabLine = { TabLineOffset, BufferLine, TabPages, seperate, Run, LSPActive, Battery }


return TabLine
