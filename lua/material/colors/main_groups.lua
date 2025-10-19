local M = {}

--- Main/base style color sets. First half of style color defenitions
---@param id any
---@return table # table that contains main table for given id (style)
local function make_main(id)
	local groups = {}
	groups.default = {
		main = {
			white = "#EEFFFF",
			gray = "#717CB4",
			black = "#000000",
			red = "#F07178",
			green = "#C3E88D",
			yellow = "#FFCB6B",
			blue = "#82AAFF",
			paleblue = "#B0C9FF",
			cyan = "#89DDFF",
			purple = "#C792EA",
			orange = "#F78C6C",
			darkred = "#DC6068",
			darkgreen = "#ABCF76",
			darkyellow = "#E6B455",
			darkblue = "#6E98EB",
			darkcyan = "#71C6E7",
			darkpurple = "#B480D6",
			darkorange = "#E2795B",
		},
	}
	groups.lighter = {
		main = {
			red = "#B20602",
			green = "#5E8526",
			yellow = "#C37101",
			blue = "#2E4F85",
			paleblue = "#54637D",
			cyan = "#067A82",
			purple = "#491ACC",
			orange = "#C43A14",
			pink = "#CC203D",
		},
	}
	groups.spacedust = {
		main = {
			white = "#fefff1",
			gray = "#c0c198",
			black = "#684c31",
			red = "#ff8a3a",
			green = "#aecab8",
			yellow = "#e3cd7b",
			blue = "#67a0ce",
			paleblue = "#87c9de",
			cyan = "#83a7b4",
			purple = "#ff8a3a",
			orange = "#ff9a4a",
			-- pink       = "#FF9CAC",

			darkred = "#E35B00",
			darkgreen = "#5cab96",
			darkyellow = "#ffc878",
			darkblue = "#0f548b",
			darkcyan = "#06afc7",
			darkpurple = "#E35B00",
			darkorange = "#E2795B",
		},
	}
	groups.spacedust_pro = {
		main = {
			white = "#f4f3ec",
			gray = "#b0ac9f",
			black = "#282823",
			red = "#ea7050", -- #ef684a
			green = "#8cd054", -- #84cf4f
			yellow = "#eabd32", -- #eab12f
			blue = "#6abaf8", -- "#54bfe6",
			paleblue = "#8fcadf",
			cyan = "#cf4a2f", -- "#60cc8a",
			purple = "#a086df", -- keywords for loop/logical, types, struct names (defining)
			orange = "#ea7741", -- number values
			-- pink       = "#FF9CAC",
			darkred = "#802f20",
			darkgreen = "#43804d",
			darkyellow = "#8c732b",
			darkblue = "#0f548b",
			darkcyan = "#06afc7",
			darkpurple = "#353e80",
			darkorange = "#994323",
		},
	}
	groups.spacedust_pro_alt = {
		main = {
			white = "#f4f3ec",
			gray = "#c0c198",
			black = "#282823",
			red = "#ff4d3a",
			green = "#4dcc66",
			yellow = "#e3d46f",
			blue = "#67a0ce",
			paleblue = "#87c9de",
			cyan = "#83a7b4",
			purple = "#5d7ed9",
			orange = "#f47133",
			-- pink       = "#FF9CAC",

			darkred = "#802f20",
			darkgreen = "#33804d",
			darkyellow = "#8c732b",
			darkblue = "#0f548b",
			darkcyan = "#06afc7",
			darkpurple = "#353e80",
			darkorange = "#E2795B",
		},
	}
	groups.fpwst = {
		main = {
			white = "#c4c4c4",
			gray = "#4e516d", --comments for vsc
			black = "#0d0d11",
			red = "#eb424d",
			green = "#6fd080",
			yellow = "#FFd965",
			blue = "#6fa5f9",
			paleblue = "#a0cadf",
			cyan = "#79cff0",
			purple = "#a59aff",
			orange = "#e08f79",
			-- pink       = "#FF9CAC",

			darkred = "#9b3a3d",
			darkgreen = "#308F50",
			darkyellow = "#d9a040",
			darkblue = "#3E6fca",
			darkcyan = "#41b6c7",
			darkpurple = "#5f50bf",
			darkorange = "#ca706a",
		},
	}
	groups.monokai_machine = {
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
	}
	groups.dusty = {
		main = {
			white = "#f0f6f2",
			gray = "#a6afb2",
			black = "#282823",
			red = "#d06d5f",
			green = "#95cf7f", -- strings
			yellow = "#cabf5f", -- (i think) struct member names, builtin const names, struct names, global alias?
			blue = "#54c2ba", -- func names, method names (when called)
			paleblue = "#9fcadf",
			cyan = "#dc6f60", -- some keywords (func, type), maybe comments?
			purple = "#ad92df", -- keywords for loop/logical, types, struct names (defining)
			orange = "#df8751", -- number values
			-- pink       = "#FF9CAC",
			darkred = "#9a4450",
			darkgreen = "#4a8062",
			darkyellow = "#8c734b",
			darkblue = "#20547b",
			darkcyan = "#069fa7",
			darkpurple = "#563e7f",
			darkorange = "#995333",
		},
	}
	groups.inferno = {
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
	}
	groups.xxx = {
		main = {
			white = "#eff5ed",
			gray = "#9aaaa4",
			black = "#0d0a0b",
			red = "#bf7f7c", --bf7a84
			green = "#9ac690", -- strings
			yellow = "#bfbc9f", -- (i think) struct member names, builtin const names, struct names, global alias?
			blue = "#c0dfe0", -- func names, method names (when called)
			paleblue = "#d0dada",
			cyan = "#90bfaa", -- some keywords (func, type), maybe comments?
			purple = "#f4a0ac", --a88fb0 keywords for loop/logical, types, struct names (defining)
			orange = "#cca8a0", -- number values
			-- pink       = "#FF9CAC",
			darkred = "#9a5043",
			darkgreen = "#6a8a70",
			darkyellow = "#5a643f",
			darkblue = "#406a6a",
			darkcyan = "#73a093",
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
	}
	groups.deusmaster = {
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
	}
	groups.omni2 = {
		--[[
#191622, #641d2d, #30543f, #614d30, #35304c, #463a62,
#3b6c52, #5c5b62, #9d1c38, #9f5810, #d67307, #e41f44,
#85765e, #ef6963, #4fa563, #5fce76, #fe8700, #9f9264,
#c4af77, #e7de79, #5b4d81, #5e9ba9, #67e480, #6cb9c9, 
#78d0e0, #ddd5b7, #e1e1e6, #e0e2ea

#c91e40, #5fcf76, #5a4b81, #80759d, #aed8e5, #1a1723, #e61f44
--]]

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
	}
	if groups[id] then
		return groups[id]
	else
		return groups.default
	end
end

-- Custom style colors. Second half of style color definitions
-- Some styles partially use colors.main table as a value source
---@param colors table[table] # Color table being built, with main table
---@param id string # style name to be applied
---@return table # table containing editor colors and partial lsp, syntax, background colors
local function make_edit_groups(colors, id)
	local eg = {}
	eg.darker = {
		editor = {
			bg = "#212121",
			bg_alt = "#1A1A1A",
			fg = "#B0BEC5",
			fg_dark = "#8C8B8B",
			selection = "#404040",
			contrast = "#1A1A1A",
			active = "#323232",
			border = "#343434",
			highlight = "#3F3F3F",
			disabled = "#474747",
			accent = "#FF9800",
			line_numbers = "#424242",
		},
		syntax = { comments = "#515151" },
	}
	eg.darker_highvis = {
		editor = { line_numbers = "#5C5C5C" },
		syntax = { comments = "#757575" },
	}
	eg.lighter = {
		syntax = { comments = "#AABFC9" },
		editor = {
			bg = "#FAFAFA",
			bg_alt = "#FFFFFF",
			contrast = "#EEEEEE",
			active = "#E7E7E8",
			border = "#D3E1E8",
			highlight = "#E7E7E8",
			disabled = "#D2D4D5",
			cursor = "#272727",

			white = "#FFFFFF",
			gray = "#717CB4",
			title = colors["main"]["black"],
			fg = "#546E7A",
			fg_dark = "#94A7B0",
			selection = "#80CBC4",
			line_numbers = "#CFD8DC",
			accent = "#00BCD4",
		},
	}
	eg.lighter_highvis = {
		editor = {
			fg = "#213B47",
			fg_dark = "#61747D",
			selection = "#e2e9e9",
			line_numbers = "#B6BFC3",
			accent = "#0089A1",
		},
		syntax = { comments = "#778C96" },
	}
	eg.spacedust = {
		editor = {
			link = "#dec264",
			cursor = "#708284",
			title = "#F0F1CE",
			bg = "#0A1E24",
			bg_alt = "#0A385C",
			fg = "#ECF0C1",
			fg_dark = "#D8CC80",
			selection = "#FFF6DE",
			contrast = "#684c31", --"#090B10",
			active = "#002831",
			border = "#232637",
			line_numbers = "#aB9a5b",
			highlight = "#1a3f6c",
			disabled = "#464B5D",
			accent = "#e35b00",
		},
		lsp = { error = "#E35B00" },
		syntax = { comments = "#537784" },
		--backgrounds = {},
	}
	eg.spacedust_pro = {
		editor = {
			bg = "#121f22", --"#1c2a2f",
			link = "#dec264",
			cursor = "#80a2a4",
			title = "#c0bb8E",
			bg_alt = "#0A385C",
			fg = "#EEE6B5",
			fg_dark = "#D8CC80",
			selection = "#bFb69E",
			contrast = "#583c2a", --"#090B10",
			active = "#002831",
			border = "#434657",
			line_numbers = "#b49349",
			highlight = "#1a506c",
			disabled = "#464B5D",
			accent = "#ef584C",
		},
		lsp = { error = "#ef7358" },
		syntax = { comments = "#7f7a65" },
	}
	eg.spacedust_pro_alt = eg.spacedust_pro
	eg.dusty = {
		backgrounds = { bg_blend = "#07191c", sidebars = "#181d25" },
		lsp = { error = "#ef7358" },
		syntax = { comments = "#4f847f" },
		editor = {
			bg = "#1a232a",
			bg_alt = "#0A385C",
			fg = "#dccfbf",
			link = "#ded284",
			cursor = "#b0aaa8",
			title = "#c0bb8E",
			fg_dark = "#bcaf80",
			selection = "#7f4455",
			contrast = "#583c2a", --"#090B10",
			active = "#002c33",
			border = "#3f5f64",
			line_numbers = "#ba9f66",
			highlight = "#1a506c",
			disabled = "#464B5D",
			accent = "#f06a5a",
			comments = "#4f847f",
		},
	}
	eg.fpwst = {
		backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
		lsp = { error = "#ef7358" },
		syntax = { comments = "#4f6072" },
		editor = {
			bg = "#131419", --"#191a1f",
			bg_alt = "#1b2835",
			fg = "#bab4b4",
			fg_darker = "#647084",
			fg_dark = "#96a0af",
			selection = "#27333c",
			contrast = "#583c2a",
			active = "#222332",
			border = "#41434f",
			line_numbers = "#405a6f",
			highlight = "#1a506c",
			disabled = "#464B5D",
			accent = "#438f55",
		},
	}
	eg.monokai_machine = {
		--backgrounds = {},
		lsp = { error = "#aa4660" },
		syntax = { comments = "#4f6072" },
		editor = {
			bg = "#212528",
			bg_alt = "#202326",
			fg = colors.main.white,
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
	eg.inferno = {
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
	eg.xxx = {
		backgrounds = { bg_blend = "#101015", sidebars = "#1a1c24" },
		lsp = { error = "#b05044" },
		syntax = { comments = "#505b66" },
		editor = {
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
	eg.omni2 = {
		--[[
#191622, #641d2d, #30543f, #614d30, #35304c, #463a62,
#3b6c52, #5c5b62, #9d1c38, #9f5810, #d67307, #e41f44,
#85765e, #ef6963, #4fa563, #5fce76, #fe8700, #9f9264,
#c4af77, #e7de79, #5b4d81, #5e9ba9, #67e480, #6cb9c9, 
#78d0e0, #ddd5b7, #e1e1e6, #e0e2ea

#c91e40, #5fcf76, #5a4b81, #80759d, #aed8e5, #1a1723, #e61f44
--]]
		editor = {
			bg = "#19161f", -- 191522
			bg_alt = "#25203c",
			fg = "#b0bec5",
			fg_dark = "#8090a0",
			selection = "#34384f",
			contrast = "#1a1c24",
			active = "#2e2639",
			border = "#e0e2ea",
			line_numbers = "#463a62", -- #c2c2bf
			highlight = "#302042",
			disabled = "#3f3a20",
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
	eg.deusmaster = {
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
	if eg[id] then
		return eg[id]
	else
		return eg.darker
	end
end

--- Extends given colors table with main group assignments, and returns
---@param colors table # colors table to extend
---@param id string # style name to be applied
---@return table # extended colors table
function M.load_main(colors, id)
	return vim.tbl_deep_extend("force", colors, make_main(id))
end

--- Extends given colors table with edit group assignments, and returns
---@param colors any # colors table to reference and extend
---@param id any # style name to be applied
---@return table # extended colors table
function M.load_edit_group(colors, id)
	return vim.tbl_deep_extend("force", colors, make_edit_groups(colors, id))
end

--- Applies all raw color assignments for a given style id
---@param colors any # colors table to reference and extend
---@param id any # style name to be applied
---@return table # extended colors table
function M.load_style(colors, id)
	colors = vim.tbl_deep_extend("force", colors, make_main(id))
	return vim.tbl_deep_extend("force", colors, make_edit_groups(colors, id))
end
return M
