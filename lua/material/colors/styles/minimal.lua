local M = {}

M.colors = {
	main = {
		white = "#eeffff",
		gray = "#717cb4",
		black = "#000000",
		red = "#e0818a",
		green = "#b3e08d",
		yellow = "#dabe8a",
		blue = "#70afe0",
		paleblue = "#c0dfff",
		cyan = "#90cfd0",
		purple = "#a49fe0",
		orange = "#f78c6c",
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
		cursor = "#708284",
		title = "#F0F1CE",
		bg = "#1c1d1f", --"#191a1f",
		bg_alt = "#1b2835",
		fg = "#bab4b4",
		fg_dark = "#70788f",
		selection = "#27333c",
		contrast = "#583c2a",
		active = "#222332",
		border = "#41434f",
		line_numbers = "#405a6f",
		highlight = "#1a506c",
		disabled = "#464B5D",
		accent = "#438f55",
	},
	lsp = { error = "#E35B00" },
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
