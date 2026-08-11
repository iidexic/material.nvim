local M = {}

M.colors = {
	main = {
		white = "#eff5ed",
		gray = "#9faaa4",
		black = "#0d0a0b",
		red = "#df6f6c", --bf7a84
		green = "#82ce7f", -- strings
		yellow = "#d0bea4", -- (i think) struct member names, builtin const names, struct names, global alias?
		blue = "#90bfaa", -- func names, method names (when called)
		paleblue = "#d0dada",
		cyan = "#90bfaa", -- some keywords (func, type), maybe comments?
		purple = "#f4b0bc", --a88fb0 keywords for loop/logical, types, struct names (defining)
		orange = "#d68e74", -- number values
		-- pink       = "#FF9CAC",
		darkred = "#9a5043",
		darkgreen = "#6a8a70",
		darkyellow = "#6a543f",
		darkblue = "#406a6a",
		darkcyan = "#73a093",
		darkpurple = "#65587f",
		darkorange = "#7f7250",
	},
	backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
	lsp = { error = "#da5f6a" },
	syntax = { comments = "#505b66" },
	editor = {
		bg = "#2a2e2f", -- 1f2120,
		bg_alt = "#191a1a",
		fg = "#e2e0e2",
		-- methods
		fg_dark = "#a09e96",
		-- vismode select
		selection = "#263938",
		contrast = "#2A1A1A",
		active = "#27282c",
		border = "#70747f",
		line_numbers = "#50535f", -- #c2c2bf
		highlight = "#3d3F43",
		disabled = "#40464a",
		accent = "#d07c94", -- ActiveLineNum
		link = "#c46dac",
		cursor = "#d0e6ff",
		title = "#f8f8f2",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			identifier = colors.main.orange,
			-- conditional = nil, -- keyword
			repeat_keyword = colors.main.cyan, -- keyword (like `for`?)
			-- storageClass = nil, -- cyan (static, register, volatile, etc)
			-- structure = nil, -- type
			-- const = nil,
			-- specialComment = nil, -- comment (special things in comments)
			-- boolean = nil, -- number
			-- float = nil, -- number
			-- statement = nil, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			-- typedef = nil, -- red
			-- special = nil, -- cyan (?)
			-- specialChar = nil, -- red (?)
			-- tag = nil, -- red (?)
			-- delimiter = nil, -- operator (like ;, maybe commas?)
			variable = colors.editor.fg, -- editor.fg
			field = colors.editor.green,
			keyword = colors.main.orange,
			value = colors.main.yellow,
			operator = colors.main.purple, -- red
			fn = colors.main.green,
			parameter = colors.main.red,
			string = colors.main.yellow,
			type = colors.main.blue,
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
