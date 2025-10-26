local M = {}

M.darker = function()
	local c = {}
	c.main = {
		white = "#EEFFFF",
		gray = "#717CB4",
		black = "#000000",
		red = "#F07178",
		green = "#C3E88D",
		yellow = "#FFCB6B",
		blue = "#82AAFF",
		paleblue = "#B0C9FF",
		cyan = "#89DDFF",
		purple = "#C792EA",
		orange = "#F78C6C",
		darkred = "#DC6068",
		darkgreen = "#ABCF76",
		darkyellow = "#E6B455",
		darkblue = "#6E98EB",
		darkcyan = "#71C6E7",
		darkpurple = "#B480D6",
		darkorange = "#E2795B",
	}
	c.editor = {
		bg = "#212121",
		bg_alt = "#1A1A1A",
		fg = "#B0BEC5",
		fg_dark = "#8C8B8B",
		selection = "#404040",
		contrast = "#1A1A1A",
		active = "#323232",
		border = "#343434",
		highlight = "#3F3F3F",
		disabled = "#474747",
		accent = "#FF9800",
		line_numbers = "#424242",
	}
	c.syntax = {
		comments = "#515151",

		variable = c.editor.fg,
		field = c.editor.fg,
		keyword = c.main.purple,
		value = c.main.orange,
		operator = c.main.cyan,
		fn = c.main.blue,
		parameter = c.main.paleblue,
		string = c.main.green,
		type = c.main.purple,
	}
	c.git = {
		added = c.main.green,
		removed = c.main.red,
		modified = c.main.blue,
	}
	c.lsp = {
		warning = c.main.yellow,
		info = c.main.paleblue,
		hint = c.main.purple,
	}
	c.backgrounds = {
		sidebars = c.editor.bg,
		floating_windows = c.editor.bg,
		non_current_windows = c.editor.bg,
		bg_blend = c.editor.bg, -- backup used for blending backgrounds (issue: #212)
		cursor_line = c.editor.active,
	}
	return c
end

M.spacedust_pro = function()
	local c = {}
	c.main = {
		white = "#f4f3ec",
		gray = "#b0ac9f",
		black = "#282823",
		red = "#ea7050", -- #ef684a
		green = "#8cd054", -- #84cf4f
		yellow = "#eabd32", -- #eab12f
		blue = "#6abaf8", -- "#54bfe6",
		paleblue = "#8fcadf",
		cyan = "#cf4a2f", -- "#60cc8a",
		purple = "#a086df", -- keywords for loop/logical, types, struct names (defining)
		orange = "#ea7741", -- number values
		-- pink       = "#FF9CAC",
		darkred = "#802f20",
		darkgreen = "#43804d",
		darkyellow = "#8c732b",
		darkblue = "#0f548b",
		darkcyan = "#06afc7",
		darkpurple = "#353e80",
		darkorange = "#994323",
	}
	c.editor = {
		bg = "#121f22", -- "#1c2a2f",
		link = "#dec264",
		cursor = "#80a2a4",
		title = "#c0bb8E",
		bg_alt = "#0A385C",
		fg = "#EEE6B5",
		fg_dark = "#D8CC80",
		selection = "#bFb69E",
		contrast = "#583c2a", -- "#090B10",
		active = "#002831",
		border = "#232637",
		line_numbers = "#aB9a5b",
		highlight = "#1a506c",
		disabled = "#464B5D",
		accent = "#ef584C",
	}
	c.lsp = { error = "#ef7358", warning = c.main.yellow, info = c.main.paleblue, hint = c.main.purple }
	c.syntax = {
		comments = "#7f7a65",
		variable = c.editor.fg,
		field = c.editor.fg,
		keyword = c.main.red,
		value = c.main.orange,
		operator = c.main.orange,
		fn = c.main.blue,
		parameter = c.main.paleblue,
		string = c.main.green,
		type = c.main.green,
	}
	c.git = { added = c.main.green, removed = c.main.red, modified = c.main.blue }
	c.backgrounds = {
		sidebars = c.editor.bg,
		floating_windows = c.editor.bg,
		non_current_windows = c.editor.bg,
		bg_blend = c.editor.bg, -- backup used for blending backgrounds (issue: #212)
		cursor_line = c.editor.active,
	}
	return c
end

M.dusty = function()
	local c = {}
	c.main = {
		white = "#f0f6f2",
		gray = "#a6afb2",
		black = "#282823",
		red = "#d06d5f",
		green = "#95cf7f", -- strings
		yellow = "#cabf5f", -- (i think) struct member names, builtin const names, struct names, global alias?
		blue = "#54c2ba", -- func names, method names (when called)
		paleblue = "#9fcadf",
		cyan = "#dc6f60", -- some keywords (func, type), maybe comments?
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
	}
	c.editor = {
		bg = "#1a232a",
		bg_alt = "#0A385C",
		fg = "#dccfbf",
		link = "#ded284",
		cursor = "#b0aaa8",
		title = "#c0bb8E",
		fg_dark = "#bcaf80",
		selection = "#7f4455",
		contrast = "#583c2a", -- "#090B10",
		active = "#002c33",
		border = "#3f5f64",
		line_numbers = "#ba9f66",
		highlight = "#1a506c",
		disabled = "#464B5D",
		accent = "#f06a5a",
		comments = "#4f847f",
	}
	c.lsp = { error = "#ef7358", warning = c.main.yellow, info = c.main.paleblue, hint = c.main.purple }
	c.syntax = {
		comments = "#4f847f",
		variable = c.editor.fg,
		repeat_keyword = c.main.red,
		field = c.editor.fg,
		keyword = c.main.purple,
		value = c.main.orange,
		operator = c.main.cyan,
		fn = c.main.blue,
		parameter = c.main.paleblue,
		string = c.main.green,
		type = c.main.purple,
	}
	c.git = { added = c.main.green, removed = c.main.red, modified = c.main.blue }
	c.backgrounds = {
		bg_blend = "#07191c",
		sidebars = "#181d25",
		floating_windows = c.editor.bg,
		non_current_windows = c.editor.bg,
		cursor_line = c.editor.active,
	}
	return c
end
return M
