local M = {}

M.colors = {
	main = {
		white = "#dfe4dd",
		gray = "#9098a0",
		black = "#0d0f16",
		red = "#bf706c",
		mutedred = "#b48a88",
		ash = "#b4afa8",
		green = "#94b270",
		mutedgreen = "#949f8a",
		yellow = "#b2a170",
		paleyellow = "#b6ae9a",
		blue = "#8fa7ae",
		-- paleblue = "#aac7cf",
		paleblue = "#baceef", -- maybe?
		cyan = "#7a9b8d",
		mutedcyan = "#9ab2b4",
		purple = "#9d7693",
		orange = "#a97d6f",

		darkred = "#804840",
		darkgreen = "#6a7e6a",
		darkyellow = "#805f40",
		darkblue = "#404c74",
		darkcyan = "#73a093",
		darkpurple = "#65587f",
		darkorange = "#805f40",
	},

	main_old = {
		white = "#eff5ed",
		gray = "#9aaaa4",
		black = "#0d0a0b",
		red = "#bf746c", --bf7a84
		green = "#a6c690", -- strings
		yellow = "#cfad70", -- (i think) struct member names, builtin const names, struct names, global alias?
		blue = "#909fc0", -- func names, method names (when called)
		paleblue = "#b0d0ca",
		cyan = "#80c2aa", -- some keywords (func, type), maybe comments?
		purple = "#fa90a4", --a88fb0 keywords for loop/logical, types, struct names (defining)
		orange = "#b87260", -- number values
		-- pink       = "#FF9CAC",
		darkred = "#9a5043",
		darkgreen = "#6a8a70",
		darkyellow = "#5a643f",
		darkblue = "#406a6a",
		darkcyan = "#5f887f",
		darkpurple = "#65587f",
		darkorange = "#7f7250",
	},
	main_alt = {
		white = "#eaf0e8",
		gray = "#808f8d",
		black = "#0d0a0b",
		red = "#da8a7a", -- b47660
		green = "#9fc08a", -- strings
		yellow = "#969278", --8a8d6a
		blue = "#b0c5bd", -- func names, method names (when called)
		paleblue = "#c0eadf",
		cyan = "#90bc92", -- some keywords (func, type), maybe comments?
		purple = "#a27f9f", -- keywords for loop/logical, types, struct names (defining)
		orange = "#c0a860", -- number values
		-- pink       = "#FF9CAC",
		darkred = "#9a5043",
		darkgreen = "#5f8f50",
		darkyellow = "#5a643f",
		darkblue = "#406a6a",
		darkcyan = "#73a093",
		darkpurple = "#65587f",
		darkorange = "#7f7250",
	},
	backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
	lsp = { error = "#b05044" },
	syntax = { comments = "#505b66" },
	editor = {
		bg = "#1b1e1e",
		bg_alt = "#141b16",
		fg = "#d2d0d2",
		fg_dark = "#868a90",
		selection = "#433d3c",
		contrast = "#205A3A",
		active = "#282a2c",
		border = "#70747f",
		line_numbers = "#50535f",
		highlight = "#3d3F43",
		disabled = "#30363a",
		accent = "#888a70",
		link = "#ba94ba",
		cursor = "#f8f8f0",
		title = "#f8f8f2",
	},
	--[[
		-- Colors
		#636053
		#bb7068
		#7d8b61
		#b29669
		#9d7693
		#92a7a3
		#1b1e1e
		#343a44
		#50535f
		#9098a0
		#d2d0d2
		--]]
	editor_old = {
		bg = "#1b1e1e", -- 1f2120,
		bg_alt = "#191a1a",
		fg = "#e2e0e2",
		fg_darker = "#5440d4",
		-- methods
		fg_dark = "#9098a0",
		-- vismode select
		selection = "#3f3a10",
		contrast = "#2A1A1A",
		active = "#282a2c",
		border = "#70747f",
		line_numbers = "#50535f", -- #c2c2bf
		highlight = "#3d3F43",
		disabled = "#40464a",
		accent = "#d07c94", -- ActiveLineNum
		link = "#c46dac",
		cursor = "#f8f8f0",
		title = "#f8f8f2",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			-- conditional = nil, -- keyword
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
			statement = colors.main.orange,
			repeat_keyword = colors.main.cyan, -- keyword (like `for`?)
			variable = colors.main.green, -- editor.fg
			property = colors.main.blue,
			keyword = colors.main.cyan,
			value = colors.editor.fg,
			operator = colors.main.red, -- red
			fn = colors.main.ash,
			parameter = colors.editor.fg_dark,
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
