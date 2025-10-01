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
			white = "#f2fffc",
			gray = "#6b7678", -- b8c4c3, 8b9798, 6b7678, 545f62, 454f53, 273136, 1D2528, 161a1d
			black = "#161a1d",
			red = "#ff6d7e", --ff6188
			green = "#a2e57b", --a9dc76
			yellow = "#ffed72", --ffd866
			blue = "#78dce8",
			paleblue = "#7cd5f9",
			cyan = "#7cd5f9", --78dce8
			purple = "#baa0f8", --ab9df2
			orange = "#FFB270", --fc9867

			darkred = "#e14775",
			darkgreen = "#269D69",
			darkyellow = "#Cf9f4A",
			darkblue = "#6E98EB",
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
			red = "#ed6057",
			green = "#babe40", -- strings
			yellow = "#f2b63a", -- (i think) struct member names, builtin const names, struct names, global alias?
			blue = "#70a0aa", -- func names, method names (when called)
			paleblue = "#c0c8d6",
			cyan = "#b06f57", -- some keywords (func, type), maybe comments?
			purple = "#fa8a8d", -- keywords for loop/logical, types, struct names (defining)
			orange = "#ef7031", -- number values
			-- pink       = "#FF9CAC",
			darkred = "#ba4020",
			darkgreen = "#6a7832",
			darkyellow = "#7a5f19",
			darkblue = "#40607a",
			darkcyan = "#7e5030",
			darkpurple = "#563e7f",
			darkorange = "#a05030",
		},
	}
	if groups[id] then
		return groups.id
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
			fg = "#b4c0c4",
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
			bg = "#262f34",
			bg_alt = "#1A1A1A",
			fg = colors.main.white,
			-- methods
			fg_dark = "#8C8B8B",
			-- vismode select
			selection = "#627a90",
			contrast = "#1A1A1A",
			active = "#30404a",
			border = "#34352f",
			line_numbers = "#90908a", -- #c2c2bf
			highlight = "#3F3F3F",
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
		lsp = { error = "#984450" },
		syntax = { comments = "#a88770" },
		editor = {
			bg = "#11100c",
			bg_alt = "#1A1A1A",
			fg = colors.main.white,
			-- methods
			fg_dark = "#8C8B8B",
			-- vismode select
			selection = "#627a90",
			contrast = "#1A1A1A",
			active = "#30404a",
			border = "#34352f",
			line_numbers = "#90908a", -- #c2c2bf
			highlight = "#3F3F3F",
			disabled = "#474747",
			accent = "#7Fe080", -- ActiveLineNum
			fg_darker = "#647084",
			link = "#c46dac",
			cursor = "#f8f8f0",
			title = "#f8f8f2",
		},
	}
	if eg[id] then
		return eg.id
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
return M
