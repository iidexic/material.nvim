local M = {}

M.colors = {
	main = {
		white = "#f0e6dd",
		gray = "#908984",
		black = "#0d1012",
		red = "#ff7050",
		green = "#9f9f64", -- cf 698e6c
		yellow = "#feeaa7", --d0ba60, caaf68
		blue = "#65abd2", -- cf 289dd9 - 30b0ff
		paleblue = "#fdcb6f", -- e4a84b (not blue)
		cyan = "#af7f70", -- c3cacf cf 6cccad
		purple = "#9274ce", -- cf 9274ce - 8a80ff
		orange = "#f5873a", -- df8031number values
		-- pink       = "#FF9CAC",
		darkred = "#ba604c",
		darkgreen = "#5f6953", -- 4f6f40
		darkyellow = "#7f6a29", -- 7a5f19
		darkblue = "#2165af", -- 40607a - cf 2165cf
		darkcyan = "#2d5c5a", --0e7a6a -  7e5030
		darkpurple = "#55398b", -- 563e7f
		darkorange = "#905020", -- a05030
	},
	--backgrounds = {},
	lsp = { error = "#a05f3a", info = "#7f604a", hint = "#abaF90" }, --info:7f7a65
	syntax = { comments = "#505b66" },
	editor = {
		bg = "#141312", -- 100f0e -- #141313
		bg_alt = "#161817",
		fg = "#d6d4d2",
		fg_darker = "#344044",
		-- methods
		fg_dark = "#a0a8a0",
		-- vismode select
		selection = "#4a2820",
		contrast = "#2A1A1A",
		active = "#282a2c",
		border = "#70747f",
		line_numbers = "#50535f", -- #c2c2bf
		highlight = "#3d3F43",
		disabled = "#40464a",
		accent = "#dFa070", -- ActiveLineNum
		link = "#c46dac",
		cursor = "#eff0c0", -- f8f8f2
		title = "#f8f8f2",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			-- identifier = nil, conditional = nil, repeat_keyword = nil,
			storageClass = colors.main.purple,
			--structure = colors.main.green,
			-- specialComment = nil,
			-- character = nil,
			-- boolean = nil,
			-- float = nil,
			--statement = colors.main.cyan, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			--typedef = colors.main.cyan, -- nogo
			-- special = nil, -- cyan
			-- specialChar = nil, -- red
			-- tag = nil, -- red
			delimiter = colors.main.blue, -- operator (like ;, maybe commas?)
			bracket = colors.main.cyan,
			-- member = nil -- struct field name
			-- parameter = nil,

			variable = colors.editor.fg, --colors.editor.fg, high % text. varname, funcname...
			field = colors.main.green, -- struct fields,
			keyword = colors.main.red,
			value = colors.main.blue,

			operator = colors.main.orange,
			fn = colors.main.green,
			parameter = colors.main.orange,
			string = colors.main.yellow, -- also rune
			type = colors.main.darkred,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.purple,
			hint = colors.main.blue,
		},
		backgrounds = {
			sidebars = colors.editor.black,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
