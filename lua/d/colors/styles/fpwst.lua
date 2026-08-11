local M = {}

M.colors = {
	main = {
		white = "#c4c4c4",
		gray = "#4e516d", --comments for vsc
		black = "#0d0d11",
		red = "#eb424d",
		green = "#6fd080",
		yellow = "#FFd965",
		blue = "#6fa5f9",
		paleblue = "#a0cadf",
		cyan = "#79cff0",
		purple = "#a59aff",
		orange = "#e08f79",
		-- pink       = "#FF9CAC",

		darkred = "#9b3a3d",
		darkgreen = "#308F50",
		darkyellow = "#d9a040",
		darkblue = "#3E6fca",
		darkcyan = "#41b6c7",
		darkpurple = "#5f50bf",
		darkorange = "#ca706a",
	},
	backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
	lsp = { error = "#ef7358" },
	syntax = { comments = "#4f6072" },
	editor = {
		bg = "#131419", --"#191a1f",
		bg_alt = "#1b2835",
		fg = "#bab4b4",
		fg_darker = "#647084",
		fg_dark = "#96a0af",
		selection = "#27333c",
		contrast = "#583c2a",
		active = "#222332",
		border = "#41434f",
		line_numbers = "#405a6f",
		highlight = "#1a506c",
		disabled = "#464B5D",
		accent = "#438f55",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
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
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
