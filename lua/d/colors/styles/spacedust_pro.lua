local M = {}

M.colors = {
	main = {
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
	},
	editor = {
		-- other_bgs darker(og) to lighter
		other_bgs = { "#121d22", "#162126", "#1f2729", "#1c2a2f" },
		bg = "#161f24", --
		link = "#dec264",
		cursor = "#80a2a4",
		title = "#c0bb8E",
		bg_alt = "#0A385C",
		fg = "#EEE6B5",
		fg_dark = "#D8CC80",
		selection = "#bFb69E",
		contrast = "#583c2a", --"#090B10",
		active = "#002831",
		border = "#434657",
		line_numbers = "#b49349",
		highlight = "#1a506c",
		disabled = "#464B5D",
		accent = "#ef584C",
	},
	lsp = { error = "#ef7358" },
	syntax = { comments = "#7f7a65" },
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
