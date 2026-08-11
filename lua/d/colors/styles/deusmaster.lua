local M = {}

M.colors = {
	main = {
		white = "#eae8cf", --ebdbb2
		gray = "#928374",
		black = "#181b20",
		red = "#fb4934",
		green = "#81be6a",
		yellow = "#fabd2f",
		blue = "#afd9e6",
		paleblue = "#cfeffa",
		cyan = "#83a598",
		purple = "#c678dd",
		orange = "#fe8019",
		--pink = "#f0a0a0",

		darkred = "#753a38",
		darkgreen = "#384a3e",
		darkyellow = "#695635",
		darkblue = "#364556",
		darkcyan = "#465c65", -- 363c45
		darkpurple = "#6f5d85", --453d56
		darkorange = "#a3592f", -- 923d38
	},
	editor = {
		bg = "#262b33", -- 2c323b
		bg_alt = "#364556",
		fg = "#ebdbb2",
		fg_dark = "#928374",
		selection = "#394850",
		contrast = "#57373a",
		active = "#20242e", -- 262b33
		border = "#928374",
		line_numbers = "#767076", -- #c2c2bf
		highlight = "#5a4a54",
		disabled = "#474747",
		accent = "#7Fe080", -- ActiveLineNum
		link = "#c46dac",
		cursor = "#ef6a58", -- eff0c0
		title = "#f8f8f2",
	},
	lsp = { error = "#ba4d48", info = "#97bac7", hint = "#b772cd" }, --info:7f7a65
	syntax = { comments = "#c0a57e" },
	backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
	git = {
		added = "#98c379",
		removed = "#ef6652",
		modified = "#8eb8e5",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			typedef = colors.main.green, -- nogo
			builtin_const = colors.main.green,
			-- builtin_fn = nil,
			-- builtin_type = nil,
			-- builtin_var = nil,

			type = colors.main.yellow,
			member = colors.main.cyan,
			variable = colors.main.fg,
			field = colors.main.cyan,
			const = colors.main.purple,
			keyword = colors.main.red,
			keyword_type = colors.main.red,
			value = colors.main.orange,
			operator = colors.main.orange,
			fn = colors.main.green,
			--parameter = colors.main.yellow,
			string = colors.main.green,
			bracket = colors.editor.fg_dark,
			property = colors.main.cyan,

			tag = colors.main.purple,
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
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
