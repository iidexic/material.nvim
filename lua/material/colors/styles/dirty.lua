local M = {}

--[[
Colors that are distinct
# #dd2222 #
# #dd9922
# #dddd22
# #40ab20
# #22dd79
# #11bbee
# #2222dd
# #9922dd
# #dd22dd
#




--]]
M.colors = {
	main = {
		white = "#eeeeee",
		gray = "#888888",
		black = "#0c1210",
		red = "#e06a6f",
		green = "#9ac08d",
		yellow = "#e0b668",
		blue = "#6e92e0",
		paleblue = "#a0d2e4",
		cyan = "#9adad0",
		purple = "#b474f0",
		orange = "#f77c64",
		--pink = "#f08cbc",

		darkred = "#dc6068",
		darkgreen = "#abcf76",
		darkyellow = "#e6b455",
		darkblue = "#6e98eb",
		darkcyan = "#71c6e7",
		darkpurple = "#b480d6",
		darkorange = "#e2795b",
	},
	editor = {
		link = "#dec264",
		cursor = "#af8272",
		title = "#9AF0E0",
		bg = "#1d1b22", --"#191a1f",
		bg_alt = "#2a2035",
		fg = "#d6c8c2",
		fg_dark = "#7a7f9f",
		selection = "#38323c",
		contrast = "#583c2a",
		active = "#38353f",
		border = "#41434f",
		line_numbers = "#605a6f",
		highlight = "#1a504c",
		disabled = "#464B5D",
		accent = "#438f55",
	},
	lsp = { error = "#E33B40" },
	syntax = { comments = "#4f6072" },
	git = {},
	backgrounds = {},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			variable = colors.editor.yellow,
			string = colors.main.paleblue,
			field = colors.editor.fg,
			keyword = colors.main.red,
			value = colors.main.yellow,
			operator = colors.editor.fg_dark,
			fn = colors.main.blue,
			parameter = colors.main.purple,
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
			-- non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
