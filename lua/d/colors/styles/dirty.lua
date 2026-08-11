local M = {}

--[[
Colors that are distinct
#aa2222 #dd2222 #dd2222 #dd2222
#aa7722 #dd9922 #dd9922 #dd9922
#aa9a22 #ddd022 #ddd022 #ddd022
#208010 #40ab20 #40ab20 #40ab20
#12997a #22dd79 #62dfa0 #22dd79
#1179ba #11bbee #44cbee #11bbee
#111188 #2240dd #5a5ff0 #7790fa
#7a1fbf #9922dd #9922dd #9922dd
#881188 #dd22dd #dd22dd #dd22dd
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
		title = "#FA70a0",
		bg = "#201d28", --"#191a1f",
		bg_alt = "#1a1622",
		fg = "#d6c8c2",
		fg_dark = "#7c81a1",
		selection = "#3b1f2a",
		contrast = "#583c2a",
		active = "#38353f",
		border = "#41436f",
		line_numbers = "#605a6f",
		highlight = "#1a504c",
		statusline = "#1a1420",
		disabled = "#464B5D",
		accent = "#438f55",
	},
	lsp = { error = "#E33B40" },
	syntax = { comments = "#6f605a" },
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
			sidebars = colors.editor.bg_alt,
			floating_windows = colors.editor.bg,
			-- non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
