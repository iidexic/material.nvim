local M = {}

M.colors = {
	main = {
		white = "#fefff1",
		gray = "#c0c198",
		black = "#684c31",
		red = "#ff8a3a",
		green = "#aecab8",
		yellow = "#e3cd7b",
		blue = "#67a0ce",
		paleblue = "#87c9de",
		cyan = "#83a7b4",
		purple = "#ff8a3a",
		orange = "#ff9a4a",
		-- pink       = "#FF9CAC",

		darkred = "#E35B00",
		darkgreen = "#5cab96",
		darkyellow = "#ffc878",
		darkblue = "#0f548b",
		darkcyan = "#06afc7",
		darkpurple = "#E35B00",
		darkorange = "#E2795B",
	},
	editor = {
		link = "#dec264",
		cursor = "#708284",
		title = "#F0F1CE",
		bg = "#0A1E24",
		bg_alt = "#0A385C",
		fg = "#ECF0C1",
		fg_dark = "#D8CC80",
		selection = "#FFF6DE",
		contrast = "#684c31", --"#090B10",
		active = "#002831",
		border = "#232637",
		line_numbers = "#aB9a5b",
		highlight = "#1a3f6c",
		disabled = "#464B5D",
		accent = "#e35b00",
	},
	lsp = { error = "#E35B00" },
	syntax = { comments = "#537784" },
	--backgrounds = {},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
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
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
