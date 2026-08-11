local M = {}
local p = {
	oldWhite = "#C8C093", -- fg dim
	fujiWhite = "#DCD7BA",

	dragonBlack0 = "#0d0c0c", -- bg m3
	dragonBlack1 = "#12120f", -- bg m2, bg dim
	["dragonBlack1.5"] = "#181612", -- bg_m1
	dragonBlack2 = "#1D1C19", -- bg_m1
	dragonBlack3 = "#181616", -- BG MAIN
	dragonBlack4 = "#282727", -- bg p1
	dragonBlack5 = "#393836", -- bg p2
	dragonBlack6 = "#625e5a", -- nontext

	dragonWhite = "#c5c9c5", -- fg
	dragonGreen = "#87a987",
	dragonGreen2 = "#8a9a7b",
	dragonPink = "#a292a3",
	dragonOrange = "#b6927b",
	dragonOrange2 = "#b98d7b",
	dragonGray = "#a6a69c",
	dragonGray2 = "#9e9b93",
	dragonGray3 = "#7a8382",
	dragonBlue2 = "#8ba4b0",
	dragonViolet = "#8992a7",
	dragonRed = "#c4746e",
	dragonAqua = "#8ea4a2",
	dragonAsh = "#737c73",
	dragonTeal = "#949fb5",
	dragonYellow = "#c4b28a",

	dragonBlue = "#658594",
	-- Random Names Added
	dragonYellowWorn = "#a99c8b", -- :)
	dragonYellowAncient = "#8a9aa3", -- :)

	-- Kanagawa Other
	autumnRed = "#C34043",
	roninYellow = "#FF9E3B",
	surimiOrange = "#FFA066",
	oniViolet = "#957FB8",
	waveAqua1 = "#6A9589",
	waveBlue1 = "#223249",
	waveBlue2 = "#2D4F67",
	sakuraPink = "#D27E99",
	waveRed = "#E46876",
	katanaGray = "#717C7C",

	-- Kanagawa Not Dragon
	lotusGreen = "#6f894e",
	lotusBlue1 = "#c7d7e0",
}

local kanagawa_faithful = {
	main = {
		white = "#c5c9c5", --dwhite
		gray = "#9e9b93", --dgray2
		black = "#12120f", --dblack1
		red = "#c4746e", --dred
		green = "#8a9a7b", --dgreen2
		yellow = "#c4b28a", --dyellow
		blue = "#8ba4b0", --dblue2
		paleblue = "#c7d7e0", --lotusBlue1
		cyan = "#8ea4a2", --daqua
		purple = "#8992a7", --dviolet
		orange = "#b6927b", --dorange
		pink = "#a292a3", --dpink

		darkred = "#C34043", --autumnRed
		darkgreen = "#6f894e", --lotusGreen
		darkyellow = "#8a7862", -- NotKanagawa (started as DragonYellow comment 2)
		darkblue = "#658594", --dragonBlue
		darkcyan = "#6A9589", --waveAqua1
		darkpurple = "#957FB8", --oniViolet
		darkorange = "#8a604c", -- NotKanagawa
	},
	editor = { -- '#171613', '#171614' , '161512'
		bg = "#181616", --"#12120f", --dragonBlack2
		bg_alt = "#12120f", --dragonBlack3
		fg = "#c5c9c5", --dwhite
		fg_dark = "#C8C093", --oldWhite
		selection = "#223249", --waveBlue1
		contrast = "#FF9E3B", --roninYellow
		active = "#25282a",
		border = "#3f4a54",
		highlight = "#2d4f67", --waveBlue2
		disabled = "#737c73", --dragonAsh
		accent = "#D27E99", --sakuraPink
		line_numbers = "#393836", --dragonBlack4
	},
}

M.colors = {
	main = {
		white = "#c5c9c5", --dwhite
		gray = "#9e9b93", --dgray2
		black = "#12120f", --dblack1
		red = "#cf776f", --dred
		green = "#88a879", --dgreen2
		yellow = "#d4b880", --dyellow
		blue = "#80a8c0", --dblue2
		paleblue = "#b0cae0", --lotusBlue1
		cyan = "#86b4b2", --daqua
		purple = "#8390ba", --dviolet
		orange = "#c0987a", --dorange
		pink = "#b892b3", --dpink

		darkred = "#C34043", --autumnRed
		darkgreen = "#6f894e", --lotusGreen
		darkyellow = "#8f7a62", -- NotKanagawa (started as DragonYellow comment 2)
		darkblue = "#658594", --dragonBlue
		darkcyan = "#6A9589", --waveAqua1
		darkpurple = "#957FB8", --oniViolet
		darkorange = "#8a604c", -- NotKanagawa
	},
	editor = { -- '#171613', '#171614' , '161512'
		bg = "#191719", --"#12120f", --dragonBlack2
		bg_alt = "#14120f", --dragonBlack3
		fg = "#c5c9c5", --dwhite
		fg_dark = "#C8C093", --oldWhite
		selection = "#223249", --waveBlue1
		contrast = "#FF9E3B", --roninYellow
		active = "#25282a",
		border = "#3f4a54",
		highlight = "#2d4f67", --waveBlue2
		disabled = "#737c73", --dragonAsh
		accent = "#D27E99", --sakuraPink
		line_numbers = "#393836", --dragonBlack4
	},
	syntax = { comments = "#515151" },
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			include = colors.main.red,
			variable = colors.main.white,
			field = colors.main.red,

			keyword = colors.main.blue,

			conditional = colors.main.orange,
			repeat_keyword = colors.main.orange,

			keyword_type = colors.main.cyan,
			typedef = colors.main.pink,

			value = colors.main.yellow,
			label = colors.main.pink,
			operator = colors.main.red,

			fn = colors.main.blue,
			fn_call = colors.main.blue,
			fn_method = colors.main.cyan,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			string_escape = colors.main.red,
			type = colors.main.purple,

			const = colors.main.orange,
			builtin_const = colors.main.purple,
			exception = colors.main.red, -- red
			special = colors.main.red, -- prob nogo
			property = colors.main.yellow, -- struct field

			delimiter = colors.main.darkorange,
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
			sidebars = "#0e0d0d",
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			line_numbers = "#161416",
			cursor_line = colors.editor.active,
		},
	}
	return vim.tbl_deep_extend("force", colors, apply)
end
return M
