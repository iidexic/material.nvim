local M = {}

M.colors = {
	main = {
		white = "#f0f6f2",
		gray = "#a6afb2",
		black = "#282823",
		red = "#d06d5f",
		green = "#95cf7f", --(95cf7f | 80ca6f) strings
		yellow = "#d0b26a", -- (i think) struct member names, builtin const names, struct names, global alias?
		blue = "#6acfb6", --(54c2ba, moved to cyan) func names, method names (when called)
		paleblue = "#dfca9f", -- 9fcadf
		cyan = "#efc0c6", --(dc6f60, not cyan) some keywords (func, type), maybe comments?
		purple = "#ad92df", -- keywords for loop/logical, types, struct names (defining)
		orange = "#df8751", -- number values
		-- pink       = "#FF9CAC",
		darkred = "#9a4450",
		darkgreen = "#4a8062",
		darkyellow = "#8c734b",
		darkblue = "#20547b",
		darkcyan = "#069fa7",
		darkpurple = "#563e7f",
		darkorange = "#995333",
	},
	backgrounds = { bg_blend = "#07191c", sidebars = "#181d25" },
	lsp = { error = "#ef7358" },
	syntax = { comments = "#4f847f" },
	editor = {
		bg = "#1a232a",
		bg_alt = "#0A385C",
		fg = "#dccfbf",
		link = "#ded284",
		cursor = "#b0aaa8",
		title = "#c0bb8E",
		fg_dark = "#bcaf80",
		selection = "#7f4455",
		contrast = "#583c2a", --"#090B10",
		active = "#002c33",
		border = "#3f5f64",
		line_numbers = "#ba9f66",
		highlight = "#1a506c",
		disabled = "#464B5D",
		accent = "#f06a5a",
		comments = "#4f847f",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			variable = colors.editor.fg,
			repeat_keyword = colors.main.red,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			label = colors.main.red,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
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
		backgrounds = { -- function to check if sidebar currently bg?
			floating_windows = colors.editor.bg,
			--sidebars = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M

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
