--Heirline Config
--https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md

--TODO:
--topline with file name and current time for fullscreen terminal
--statusline features: (last modification, os.time() - getftime) (lsp)


-- local WinBar = {{...}, {{...}, {...}}}
--
-- local TabLine = {{...}, {...}, {...}}


local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local palettes = { 'dracula' }
local colors

for _, value in pairs(palettes) do
	if vim.g.color_scheme == value then
		colors = require(vim.g.color_scheme ..".palette")
	else
		colors = {
			bright_bg = utils.get_highlight("Folded").bg,
			bright_fg = utils.get_highlight("Folded").fg,
			red = utils.get_highlight("DiagnosticError").fg,
			dark_red = utils.get_highlight("DiffDelete").bg,
			green = utils.get_highlight("String").fg,
			bright_green = utils.get_highlight("String").fg,
			bright_yellow = utils.get_highlight("function").fg,
			blue = utils.get_highlight("Function").fg,
			gray = utils.get_highlight("NonText").fg,
			orange = utils.get_highlight("Constant").fg,
			purple = utils.get_highlight("Statement").fg,
			cyan = utils.get_highlight("Special").fg,
			diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			diag_error = utils.get_highlight("DiagnosticError").fg,
			diag_hint = utils.get_highlight("DiagnosticHint").fg,
			diag_info = utils.get_highlight("DiagnosticInfo").fg,
			comment = utils.get_highlight("Comment").fg
			-- git_del = utils.get_highlight("diffDeleted").fg,
			-- git_add = utils.get_highlight("diffAdded").fg,
			-- git_change = utils.get_highlight("diffChanged").fg,
		}
	end
end


require('heirline').load_colors(colors)


local inner_ViMode = {
    -- get vim current mode, this information will be required by the provider
    -- and the highlight functions, so we compute it only once per component
    -- evaluation and store it as a component attribute
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()

        -- execute this only once, this is required if you want the ViMode
        -- component to be updated on operator pending mode
        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:*o",
                command = 'redrawstatus'
            })
            self.once = true
        end
    end,
    -- Now we define some dictionaries to map the output of mode() to the
    -- corresponding string and color. We can put these into `static` to compute
    -- them at initialisation time.
    static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
            n = "Normal",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "Visual",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "Insert",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "Command",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
        },
        mode_colors = {
            n = "purple" ,
            i = "bright_green",
            v = "bright_yellow",
            V =  "bright_yellow",
            ["\22"] =  "cyan",
            c =  "red",
            s =  "purple",
            S =  "purple",
            ["\19"] =  "purple",
            R =  "orange",
            r =  "orange",
            ["!"] =  "red",
            t =  "red",
        }
    },
    -- We can now access the value of mode() that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    -- To be extra meticulous, we can also add some vim statusline syntax to
    -- control the padding and make sure our string is always at least 2
    -- characters long. Plus a nice Icon.
    provider = function(self)
        return " %2("..self.mode_names[self.mode].."%)"
    end,
    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = colors.black, bg = self.mode_colors[mode], bold = true, }
    end,
    -- Re-evaluate the component only on ModeChanged event!
    -- This is not required in any way, but it's there, and it's a small
    -- performance improvement.
    update = {
        "ModeChanged",
    },
}

local ViMode = utils.surround({' ', ' '}, function() return inner_ViMode.static.mode_colors[vim.fn.mode(1)] end, inner_ViMode)



-------------------------------------------------------------------------------------------------------------------




local FileNameBlock = {
    -- let's first set up some attributes needed by this component and it's children
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}
-- We can now define some children separately and add them later

local FileIcon = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
        self.extension = vim.fn.fnamemodify(self.filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, self.extension, { default = true })
    end,
    provider = function(self)
        return  " " .. self.icon .. " "
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end,
	on_click = {
        callback = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
				self.extension = vim.fn.fnamemodify(self.filename, ":e")

				if self.extension == 'lua' then
					vim.cmd('!xdg-open https://www.lua.org/manual/5.3/')
				elseif self.extension == 'py' then
					vim.cmd('!xdg-open https://docs.python.org/3.10/index.html')
				else
					vim.cmd('!xdg-open https://google.com')
				end
			end,
        name = "StandardLibrary",
    }
}


local FileName = {
    provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return " " .. filename
    end,
    hl = { fg = utils.get_highlight("Directory").fg },
	on_click = {
        callback = function()
			vim.cmd('pwd')
		    end,
        name = "FilePath",
    }
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = "[+]",
        hl = { fg = "green" },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = "orange" },
    },
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = "cyan", bold = true, force=true }
        end
    end,
}


-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
    utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    FileFlags,
    { provider = '%='} -- this means that the statusline is cut here when there's not enough space
)



-------------------------------------------------------------------------------------------------------------------


-- I take no credits for this! :lion:
local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return ' ' .. string.rep(self.sbar[i], 1)
    end,
    hl = { fg = "comment", bg = "bg" },
}


-------------------------------------------------------------------------------------------------------------------


local LSPActive = {
    condition = conditions.lsp_attached,
    update = {'LspAttach', 'LspDetach'},

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for _, server in pairs(vim.lsp.buf_get_clients(0)) do
            table.insert(names, server.name)
        end
        return "  [" .. table.concat(names, " ") .. "] "
    end,
    hl = { fg = "green", bold = true },
	on_click = {
        callback = function()
			vim.cmd('LspInfo')
		    end,
        name = "LspInfo",
    }
}
if not conditions.lsp_attached then
	LSPActive = {
		provider = "No LangServer",
    	hl = { fg = "green", bold = true },
	}
end

-------------------------------------------------------------------------------------------------------------------
local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = "orange" },


    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = "green" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "red" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "orange" },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}


local Diagnostics = {

    condition = conditions.has_diagnostics,
	static = {
        -- error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text, --' '
        -- warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text, --' '
        -- info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text, --'כֿ '
        -- hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text, --' '
		error_icon = ' ',
		warn_icon = ' ',
		info_icon = 'כֿ ',
		hint_icon = ' ',
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    -- {
    --     provider = "![",
    -- },
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = "#dd2423" },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = "#fd9c3b" },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = "green" },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "#5b7e75" },
    },
    -- {
    --     provider = "]",
    -- },
}

-- Diagnostics = utils.surround({"![", "]"}, nil, Diagnostics)


-------------------------------------------------------------------------------------------------------------------

local inner_Time = {
    init = function(self)
        self.time = os.date('*t')
		self.icon = ' '
        self.icon_color = "bright_blue"
    end,
    provider = function(self)
		local time=self.time.hour..":"..self.time.min
		-- print(self.time.min)
        return  (" " .. self.icon .. " ").. time:format('%02d')
    end,
    hl = function(self)
        return { fg = colors.black, bg = colors.cyan , bold = true }
    end
}

local Time = utils.surround({'', ''}, function() return colors.cyan end, inner_Time)


-------------------------------------------------------------------------------------------------------------------

local plugins = {
    init = function(self)
		self.plugins = require("lazy").stats().loaded
        self.icon_color = "orange"
		self.icon = " "
    end,
    provider = function(self)
		return self.icon .. " " .. self.plugins --.. " "
    end,
    hl = function(self)
        return { fg = self.icon_color, bold = true }
    end,
	on_click = {
        callback = function()
			vim.cmd('Lazy home')
		    end,
        name = "Lazy Plugins",
    }
}

-------------------------------------------------------------------------------------------------------------------
local component_separators = { left = '  ', right = '  '}
    -- section_separators = { left = '', right = ''},

local left_seperator = {
    init = function(self)
		self.icon = component_separators.left
		-- self.icon = '  '
		-- self.icon = '  '
        self.icon_color = "comment"
    end,
    provider = function(self)
		return self.icon
    end,
    hl = function(self)
        return { fg = self.icon_color, bold = true }
    end
}
local right_seperator = {
    init = function(self)
		self.icon = component_separators.right
		-- self.icon = '  '
		-- self.icon =  ' '
        self.icon_color = "comment"
    end,
    provider = function(self)
		return self.icon
    end,
    hl = function(self)
        return { fg = self.icon_color, bold = true }
    end
}

-------------------------------------------------------------------------------------------------------------------
-- require('heirline').load_colors(setup_colors())

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        utils.on_colorscheme(colors)
    end,
    group = "Heirline",
})

local StatusLine = {ViMode, left_seperator, Git, left_seperator, FileNameBlock,  Diagnostics, right_seperator, plugins, right_seperator, FileIcon, right_seperator, LSPActive, right_seperator, Time, ScrollBar }

-- et_highlight("TabLineSel").bg
--     else
--         return utils.get_highlight("TabLine").bg
vim.cmd.highlight('TabLine guibg='..colors.white)
vim.cmd.highlight('TabLineSel guibg='..colors.orange)
-- vim.cmd.highlight('TabLine guifg='..colors.white)


local TabLine = require("ui.tabline")
-- the winbar parameter is optional!
-- require'heirline'.setup(StatusLine, WinBar, TabLine)
vim.cmd.highlight('statusline guibg='.. colors.bg)
vim.cmd.highlight('statusline  guifg='.. colors.bright_green)
vim.o.showtabline = 2
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])


-------------------------------------------------------------------------------------------------------------------
require'heirline'.setup(StatusLine,nil, TabLine)
-------------------------------------------------------------------------------------------------------------------

    -- -- Quickly add a condition to the ViMode to only show it when buffer is active!
    -- { condition = conditions.is_active, ViMode, Space }, FileType, Space, TerminalName, Align,

vim.api.nvim_create_autocmd('InsertLeave', {
	callback = function()
		require'heirline'.setup(StatusLine)
	end
})
