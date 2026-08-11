local M = {}

M.colors = {
	main = {
		white = "#f9f4dc",
		midwhite = "#dcd8c6",
		darkwhite = "#aeaa9d",
		gray = "#82837d",
		black = "#181b20",
		red = "#f0918e",
		midred = "#e06060",
		darkred = "#ca4040",
		green = "#affcaa",
		midgreen = "#7bd680",
		darkgreen = "#4a9752",
		yellow = "#f7d87e",
		midyellow = "#eac068",
		darkyellow = "#9e765f",
		paleblue = "#bfefff",
		blue = "#80d4f0",
		midblue = "#54a0cf",
		darkblue = "#2a6990",
		cyan = "#aaefe2",
		midcyan = "#60b8b0",
		darkcyan = "#507886",
		purple = "#a4aaff",
		midpurple = "#808fef",
		darkpurple = "#4f5abc",
		orange = "#fcbc70",
		midorange = "#d08b4a",
		darkorange = "#a05a30",
		pink = "#fa9aaf",
		midpink = "#df6f99",
		darkpink = "#a04872",
	},
	backgrounds = { bg_blend = "#1a1a1f", sidebars = "#232222" },
	lsp = { error = "#ef5358" },
	syntax = { comments = "#4a5466" },
	editor = {
		bg = "#272925", --"#10101f",
		bg_alt = "#2b2f2d",
		fg = "#cfcac8",
		fg_darker = "#bdb6b0",
		fg_dark = "#107f70",
		selection = "#3a3e3a",
		contrast = "#5f1f38",
		active = "#16150a",
		statusline = "#1f1e18",
		cursorline = "#242322",
		border = "#30302a",
		line_numbers = "#4a4a3f",
		highlight = "#1a506c",
		disabled = "#565a52",
		accent = "#70886a",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {

		syntax = {
			-- [NO GO] character typedef = nil, -- nogo [?] specialChar=red , include=macro
			--structure = colors.main.green, nogo
			--storageClass = colors.main.midpink,
			--statement = colors.main.darkyellow,
			--label = colors.main.white, --probably no-go, case, default, etc.
			identifier = colors.main.darkpurple, --Probably no-go
			field = colors.main.darkpurple, -- probably no-go

			--[VAR]
			--[VALUE (number)]
			-- float = nil,
			-- boolean = nil,
			--[KEYWORD]
			conditional = colors.main.midcyan,
			repeat_keyword = colors.main.darkcyan,
			keyword = colors.main.midred,
			keyword_type = colors.main.red,
			kw_return = colors.main.cyan,
			--
			--[TYPE]
			type = colors.main.midpurple,
			type_builtin = colors.main.paleblue,
			typedef = colors.main.purple,
			type_qualifier = colors.main.darkpurple,
			--[OPERATOR]

			-- [OTHER]
			-- specialComment = nil,
			member = colors.main.midgreen, -- struct field (field)
			-- tag_delim = nil, -- cyan
			-- tag_attrib = nil, -- purple
			-- [PUNCTUATION]
			delimiter = colors.main.darkgreen,
			string_escape = colors.main.midpink,
			bracket = colors.main.darkcyan,

			-- (HARD-ASSIGNED)
			const = colors.main.midyellow,
			exception = colors.main.midred, -- red
			special = colors.main.midpink, -- prob nogo
			property = colors.main.yellow, -- struct field

			variable = colors.main.midgreen,

			value = colors.main.purple,
			operator = colors.main.orange,

			fn = colors.main.orange,
			fn_call = colors.main.midorange,
			fn_method = colors.main.cyan,
			fn_method_call = colors.main.midcyan,

			parameter = colors.main.midyellow,
			string = colors.main.fg,
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
			sidebars = colors.backgrounds.sidebars,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
