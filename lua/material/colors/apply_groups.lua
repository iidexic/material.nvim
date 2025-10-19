local M = {}

--- unused, reference
M.existing_groups = {
	"default",
	"defaultSidebar",
	"alternate",
	"monokai",
	"poopy",
	"warm",
	"xxx",
	"deusmaster",
}

--- Assigns existing raw color values to ui elements/syntax. Colors are applied differently in each group.
--- Returned group is determined by given id string
---@param colors any # Colors table to pull values from
---@param id any # ID of apply group to return
---@return table # apply group partial color table
local function make_groups(colors, id)
	local apply = {}
	apply.default = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.purple,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	apply.default_extended = {
		syntax = {
			variable = colors.editor.fg,
			identifier = nil,
			conditional = nil, -- keyword
			repeat_keyword = nil, -- keyword (like `for`?)
			storageClass = nil, -- cyan (static, register, volatile, etc)
			string = colors.main.green,
			structure = nil, -- type
			const = nil,
			specialComment = nil, -- comment (special things in comments)
			boolean = nil, -- number
			float = nil, -- number
			statement = nil, -- cyan
			label = nil, -- keyword (case, default, etc.)
			exception = nil, -- red
			include = nil, -- macro
			typedef = nil, -- red
			special = nil, -- cyan (?)
			specialChar = nil, -- red (?)
			tag = nil, -- red (?)
			delimiter = nil, -- operator (like ;, maybe commas?)
			-- debug = nil, -- red
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			type = colors.main.purple,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	apply.defaultSidebar = {
		editor = {
			variable = colors.editor.fg,
			field = colors.editor.green,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
		},
		syntax = {
			type = colors.main.purple,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = { -- function to check if sidebar currently bg?
			floating_windows = colors.editor.bg,
			--sidebars = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	apply.alternate = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.fg,
			keyword = colors.main.red,
			value = colors.main.orange,
			operator = colors.main.orange,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.green,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	apply.dusty = {
		syntax = {
			-- identifier = nil,
			-- conditional = nil,
			-- repeat_keyword = nil,
			-- storageClass = nil,
			-- structure = nil,
			-- specialComment = nil,
			-- character = nil,
			-- boolean = nil,
			-- float = nil,
			-- statement = nil, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			-- typedef = nil, -- red
			-- special = nil, -- cyan
			-- specialChar = nil, -- red
			-- tag = nil, -- red
			-- debug = nil, -- red
			variable = colors.editor.fg,
			repeat_keyword = colors.main.red,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.purple,
		},
		editor = {
			variable = colors.editor.fg,
			field = colors.editor.green,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = { -- function to check if sidebar currently bg?
			floating_windows = colors.editor.bg,
			--sidebars = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}

	apply.poopy = {
		syntax = {
			variable = colors.main.green,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.yellow,
			operator = colors.main.orange,
			fn = colors.main.red,
			parameter = colors.main.green,
			string = colors.main.paleblue,
			type = colors.main.red,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	apply.monokai = {
		syntax = { -- identifier = nil,
			-- conditional = nil,
			-- repeat_keyword = nil,
			storageClass = colors.main.purple,
			structure = colors.main.green,
			-- specialComment = nil,
			-- character = nil,
			-- boolean = nil,
			-- float = nil,
			--statement = colors.main.cyan, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			typedef = colors.main.cyan, -- nogo
			-- special = nil, -- cyan
			-- specialChar = nil, -- red
			-- tag = nil, -- red
			-- delimiter = nil, -- operator (like ;, maybe commas?)
			-- member = nil -- struct field name
			-- parameter = nil,
			variable = colors.editor.fg, -- editor.fg
			field = colors.editor.purple,
			keyword = colors.main.red,
			value = colors.main.purple,
			operator = colors.main.red,
			fn = colors.main.green,
			parameter = colors.main.darkyellow,
			string = colors.main.yellow,
			type = colors.main.cyan,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	apply.warm = {
		syntax = { -- identifier = nil, conditional = nil, repeat_keyword = nil,
			storageClass = colors.main.purple,
			--structure = colors.main.green,
			-- specialComment = nil,
			-- character = nil,
			-- boolean = nil,
			-- float = nil,
			--statement = colors.main.cyan, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			--typedef = colors.main.cyan, -- nogo
			-- special = nil, -- cyan
			-- specialChar = nil, -- red
			-- tag = nil, -- red
			delimiter = colors.main.blue, -- operator (like ;, maybe commas?)
			bracket = colors.main.cyan,
			-- member = nil -- struct field name
			-- parameter = nil,

			variable = colors.editor.fg, --colors.editor.fg, high % text. varname, funcname...
			field = colors.main.green, -- struct fields,
			keyword = colors.main.red,
			value = colors.main.blue,

			operator = colors.main.orange,
			fn = colors.main.green,
			parameter = colors.main.orange,
			string = colors.main.yellow, -- also rune
			type = colors.main.darkred,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.purple,
			hint = colors.main.blue,
		},
		backgrounds = {
			sidebars = colors.editor.black,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	apply.xxx = {
		syntax = {
			identifier = colors.main.orange,
			-- conditional = nil, -- keyword
			repeat_keyword = colors.main.cyan, -- keyword (like `for`?)
			-- storageClass = nil, -- cyan (static, register, volatile, etc)
			-- structure = nil, -- type
			-- const = nil,
			-- specialComment = nil, -- comment (special things in comments)
			-- boolean = nil, -- number
			-- float = nil, -- number
			-- statement = nil, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			-- typedef = nil, -- red
			-- special = nil, -- cyan (?)
			-- specialChar = nil, -- red (?)
			-- tag = nil, -- red (?)
			-- delimiter = nil, -- operator (like ;, maybe commas?)
			variable = colors.editor.fg, -- editor.fg
			field = colors.editor.green,
			keyword = colors.main.orange,
			value = colors.main.yellow,
			operator = colors.main.purple, -- red
			fn = colors.main.green,
			parameter = colors.main.darkyellow,
			string = colors.main.yellow,
			type = colors.main.blue,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	apply.deusmaster = {
		syntax = {
			typedef = colors.main.yellow, -- nogo
			variable = colors.editor.fg_dark,
			field = colors.main.cyan,
			keyword = colors.main.red,
			value = colors.main.orange,
			operator = colors.main.orange,
			fn = colors.main.blue,
			--parameter = colors.main.yellow,
			string = colors.main.green,
			type = colors.main.green,
			member = colors.main.cyan,
			bracket = colors.main.fg,
			property = colors.main.cyan,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	apply.omni2 = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.purple,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	if apply[id] then
		return apply[id]
	else
		return apply.default
	end
end

---sets how colors are applied to vim highlight groups
---@param colors table colors table to apply to
---@param id string name of apply group
function M.apply(colors, id)
	colors = vim.tbl_deep_extend("force", colors, make_groups(colors, id))
	return colors
end

return M
