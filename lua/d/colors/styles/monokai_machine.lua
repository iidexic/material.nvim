local M = {}

M.colors = {
	main = {
		-- old/alt:
		-- grays: b8c4c3, 8b9798, 6b7678, 545f62, 454f53, 273136, 1D2528, 161a1d --red = ff6188
		--green = a9dc76 --yellow = ffd866 --cyan = 78dce8 --purple = ab9df2 --orange = ff9867
		white = "#f2fffc",
		gray = "#6b7678",
		black = "#161a1d",
		red = "#f07e86", -- #ff6d7e
		green = "#a2e57b",
		yellow = "#ffed72",
		blue = "#50acff", -- dev: 78dce8
		paleblue = "#afe4ff", -- dev: 7cd5f9
		cyan = "#6cdff9", -- dev: 7cd5f9
		purple = "#baa0f8",
		orange = "#FFB270",

		darkred = "#e14775",
		darkgreen = "#269D69",
		darkyellow = "#Cf9f4A",
		darkblue = "#6E98EB", -- dev: 6E98EB
		darkcyan = "#4C8Ca8",
		darkpurple = "#7058BE",
		darkorange = "#E16032",
	},
	--backgrounds = {},
	lsp = { error = "#aa4660" },
	syntax = { comments = "#4f6072" },
	editor = {
		bg = "#212528",
		bg_alt = "#202326",
		-- methods
		fg_dark = "#8C9B9B",
		-- vismode select
		selection = "#627a90",
		contrast = "#1A1A1A",
		active = "#2e3639",
		border = "#545052",
		line_numbers = "#767076", -- #c2c2bf
		highlight = "#4F5F5F",
		disabled = "#474747",
		accent = "#7Fe080", -- ActiveLineNum
		fg_darker = "#647084",
		link = "#c46dac",
		cursor = "#f8f8f0",
		title = "#f8f8f2",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = { -- identifier = nil,
			-- conditional = nil,
			-- repeat_keyword = nil,
			storageClass = colors.main.purple,
			structure = colors.main.green,
			-- specialComment = nil,
			-- character = nil,
			-- boolean = nil,
			-- float = nil,
			--statement = colors.main.cyan, -- cyan
			-- label = nil, -- keyword (case, default, etc.)
			-- exception = nil, -- red
			-- include = nil, -- macro
			typedef = colors.main.cyan, -- nogo
			-- special = nil, -- cyan
			-- specialChar = nil, -- red
			-- tag = nil, -- red
			-- delimiter = nil, -- operator (like ;, maybe commas?)
			-- member = nil -- struct field name
			-- parameter = nil,
			variable = colors.editor.fg, -- editor.fg
			field = colors.editor.purple,
			keyword = colors.main.red,
			value = colors.main.purple,
			operator = colors.main.red,
			fn = colors.main.green,
			parameter = colors.main.darkyellow,
			string = colors.main.yellow,
			type = colors.main.cyan,
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
		editor = {
			fg = colors.main.white,
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
