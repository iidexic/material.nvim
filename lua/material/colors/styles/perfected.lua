local M = {}

M.colors = {
	main = {
		--#e06050 #ec9a60 #f0d06a #7fdf6f
		--#34c0f0 #60eaaf #a0d8fb #bc7fef #faaacf
		--
		-- quick 4color
		-- #333244, #7f8cf0, #FA5A59, #73F5B5, #FAF083, #F5F4EA,
		--
		white = "#f4f3ec",
		gray = "#adacb0",
		black = "#20212a",
		red = "#ea7270", -- #ef684a
		midred = "#c05f60",
		palered = "#fa9b98",
		green = "#7cd06d", -- #84cf4f
		yellow = "#efe09a", -- #eab12f, #e0ca1f
		midyellow = "#e4b03f", -- #eab12f, #e0ca1f
		blue = "#5fc0f0", -- "#54bfe6",
		paleblue = "#b0e4f0",
		cyan = "#80efc0",
		purple = "#ac8cee", -- keywords for loop/logical, types, struct names (defining)
		orange = "#fa8051", -- number values
		pink = "#fa8acf",
		midwhite = "#dcc9cf",
		midgreen = "#50a066",
		midblue = "#409eca",
		midpurple = "#825fe8",
		midcyan = "#4aca9a",
		darkred = "#ca3a40",
		darkgreen = "#3b7f40",
		darkyellow = "#b07e30",
		darkblue = "#364a84",
		darkcyan = "#2094a0",

		darkpurple = "#543a9f",
		darkorange = "#a05440",
		darkpink = "#a04872",
		fuckyou = "#DF20FF",
	},
	backgrounds = {
		bg_blend = "#37198c",
		sidebars = "#131319",
		floating_windows = "#1f1d2a",
	},
	lsp = { error = "#ef7358" },
	syntax = { comments = "#7a7e8d" },
	editor = {
		bg = "#17181e",
		cursorline = "#10111a",
		bg_alt = "#24161f",
		fg = "#cacfda",
		link = "#df92d0",
		cursor = "#cddaae",
		title = "#e0bbaE",
		fg_dark = "#acb6be",
		selection = "#402630",
		contrast = "#583f4a", --"#090B10",
		active = "#3a485e",
		statusline = "#20242a",
		border = "#2f304a",
		disabled = "#46485D", -- first tabrow
		line_numbers = "#404a5a",
		highlight = "#1a506c",
		accent = "#f06a5a",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			builtin_type = colors.main.purple,
			member = colors.main.midcyan, -- struct field (field)

			delimiter = colors.main.pink,

			-- (HARD-ASSIGNED)
			storageClass = colors.main.fuckyou, -- nogo?
			statement = colors.main.fuckyou, -- nogo?
			const = colors.main.blue,
			exception = colors.main.red, -- red
			special = colors.main.gray, -- cyan
			property = colors.main.midyellow, -- struct field

			variable = colors.editor.fg,
			field = colors.main.orange,

			keyword = colors.main.red,
			conditional = colors.main.palered,
			repeat_keyword = colors.main.palered,
			keyword_type = colors.main.purple,
			bracket = colors.main.cyan,

			value = colors.main.yellow,
			integer = colors.main.yellow,
			float = colors.main.palered,
			operator = colors.main.orange,

			fn = colors.main.cyan,
			fn_call = colors.main.midcyan,
			fn_method = colors.main.paleblue,
			fn_method_call = colors.main.blue,

			parameter = colors.main.yellow,
			arg = colors.main.yellow,
			string = colors.editor.fg,
			type = colors.main.green,
			kw_return = colors.main.red,
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
			--sidebars = colors.editor.bg,
			--floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			statusline = colors.backgrounds.statusline or colors.editor.bg,
		},
		-- more syntax
		--[VAR]
		-- identifier = nil,
		--[VALUE (number)]
		-- float = nil,
		-- boolean = nil,
		--[KEYWORD]
		-- conditional = nil,
		-- repeat_keyword = nil,
		-- label = nil, --probably no-go, case, default, etc.
		-- kw_return = nil, -- return
		--
		--[TYPE]
		--structure = colors.main.green,
		--[OPERATOR]
		-- [OTHER]
		-- specialComment = nil,
		-- tag_delim = nil, -- cyan
		-- tag_attrib = nil, -- purple

		-- [NO GO] character typedef = nil, -- nogo [?] specialChar=red , include=macro
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
