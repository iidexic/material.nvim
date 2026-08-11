local M = {}

M.colors = {
	main = {
		white = "#f9f4dc",
		midwhite = "#dcd8c6",
		darkwhite = "#aeaa9d",
		gray = "#82837d",
		black = "#181b20",
		red = "#f08f8a",
		midred = "#e06860",
		darkred = "#ca3a40",
		green = "#b2f8aa",
		midgreen = "#74ca6e",
		darkgreen = "#4b9f40",
		yellow = "#fadf8a",
		midyellow = "#e0b440",
		darkyellow = "#b07e30",
		paleblue = "#baebff",
		blue = "#90ccf0",
		midblue = "#5a9ece",
		darkblue = "#2e5f90",
		cyan = "#aaefe2",
		midcyan = "#6ac6c0",
		darkcyan = "#208f9f",
		-- cyan = "#afecef", -- #aaefe2
		-- midcyan = "#68b6c0", -- #6ac6c0
		-- darkcyan = "#20809f", -- #208f9f
		-- teal = "#aef0d6", -- #aaefe2
		-- midteal = "#6adab8", -- #6ac6c0
		-- darkteal = "#209f8d", -- #208f9f

		purple = "#bfa0fa",
		midpurple = "#926fe8",
		darkpurple = "#5a3eaf",
		orange = "#fab880",
		midorange = "#d08b4a",
		darkorange = "#a05a30",
		pink = "#fa9aaf",
		midpink = "#df6f99",
		darkpink = "#a04872",
	},
	backgrounds = { bg_blend = "#1a1a1f", sidebars = "#1a1c24" },
	lsp = { error = "#ef5358" },
	syntax = { comments = "#4a5466" },
	editor = {
		bg = "#16171a", --"#10101f",
		bg_alt = "#2b2f2d",
		fg = "#c6c2c4",
		fg_darker = "#909caa",
		fg_dark = "#707f94",
		selection = "#2a2e30",
		contrast = "#5f1f38",
		active = "#1b1c24",
		statusline = "#22232a",
		cursorline = "#242a2c",
		border = "#41434f",
		line_numbers = "#404a4f",
		highlight = "#1a506c",
		disabled = "#4d5a5f",
		accent = "#90c04f",
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
