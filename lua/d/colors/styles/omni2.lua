local M = {}
--[[
#191622, #641d2d, #30543f, #614d30, #35304c, #463a62,
#3b6c52, #5c5b62, #9d1c38, #9f5810, #d67307, #e41f44,
#85765e, #ef6963, #4fa563, #5fce76, #fe8700, #9f9264,
#c4af77, #e7de79, #5b4d81, #5e9ba9, #67e480, #6cb9c9, 
#78d0e0, #ddd5b7, #e1e1e6, #e0e2ea

#c91e40, #5fcf76, #5a4b81, #80759d, #aed8e5, #1a1723, #e61f44
--]]

M.colors = {
	main = {
		white = "#e1e1e6",
		gray = "#5c5b62",
		black = "#191622",
		red = "#e41f44",
		green = "#5fcf76",
		yellow = "#e7de79",
		blue = "#78d0e0",
		paleblue = "#aed8e5",
		cyan = "#c4af77", -- 5e9ba9
		purple = "#5a4b81",
		orange = "#fe8700",
		pink = "#f0a0a0",

		darkred = "#9d1c38",
		darkgreen = "#3b6c52",
		darkyellow = "#614d30",
		darkblue = "#5e9ba9",
		darkcyan = "#85765e",
		darkpurple = "#463a62",
		darkorange = "#9f5810",
	},
	editor = {
		bg = "#19161f", -- 191522
		bg_alt = "#25203c",
		fg = "#d0dee5",
		fg_dark = "#8090a0",
		selection = "#34384f",
		contrast = "#1a1c24",
		active = "#2e2639",
		border = "#e0e2ea",
		line_numbers = "#463a62", -- #c2c2bf
		highlight = "#302042",
		disabled = "#7a6b40",
		accent = "#ef6963", -- ActiveLineNum
		link = "#c46dac",
		cursor = "#cac28d", -- f8f8f2
		title = "#f8f8f2",
	},
	lsp = { error = "#e06c6f", info = "#78d0e0", hint = "#ddd5b7" }, --info:7f7a65
	syntax = { comments = "#463a62" },
	backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
	git = {
		added = "#00ff00",
		removed = "#ff0000",
		modified = "#0000ff",
	},
}

M.apply = function(colors)
	colors = vim.tbl_deep_extend("force", colors, M.colors)
	local apply = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.purple,
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
