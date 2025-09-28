local high_visibility = require("material.util.config").settings.high_visibility
local materialMain = {
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
	-- pink       = "#FF9CAC",

	darkred = "#DC6068",
	darkgreen = "#ABCF76",
	darkyellow = "#E6B455",
	darkblue = "#6E98EB",
	darkcyan = "#71C6E7",
	darkpurple = "#B480D6",
	darkorange = "#E2795B",
}
local spacedustMain = {
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
}
local spacedust_pro_Main = {
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
}
local shit_main = {
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
}

local applyGroup = "default"

local monokai_machine_main = {
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
}

---colors table
local colors = {
	main = {
		white = "#eeffff",
		gray = "#717cb4",
		black = "#000000",
		red = "#f07178",
		green = "#c3e88d",
		yellow = "#ffcb6b",
		blue = "#82aaff",
		paleblue = "#b0c9ff",
		cyan = "#89ddff",
		purple = "#c792ea",
		orange = "#f78c6c",
		pink = "#ff9cac",

		darkred = "#dc6068",
		darkgreen = "#abcf76",
		darkyellow = "#e6b455",
		darkblue = "#6e98eb",
		darkcyan = "#71c6e7",
		darkpurple = "#b480d6",
		darkorange = "#e2795b",
	},
	---colors applied to the editor
	editor = { link = "#dec264", cursor = "#708284", title = "#F0F1CE" },
	lsp = { error = "#E35B00" },
	syntax = {},
	git = {},
	backgrounds = {},
}

-- Style specific colors

if vim.g.material_style == "darker" then
	applyGroup = "default"
	-- Darker theme style
	colors.main = materialMain

	if high_visibility.darker then
		-- Darker theme style with high contrast
		colors.editor.line_numbers = "#5C5C5C"
		colors.syntax.comments = "#757575"
	else
		-- default Darker theme style
		colors.editor.line_numbers = "#424242"
		colors.syntax.comments = "#515151"
	end

	colors.editor.bg = "#212121"
	colors.editor.bg_alt = "#1A1A1A"
	colors.editor.fg = "#B0BEC5"
	colors.editor.fg_dark = "#8C8B8B"
	colors.editor.selection = "#404040"
	colors.editor.contrast = "#1A1A1A"
	colors.editor.active = "#323232"
	colors.editor.border = "#343434"
	colors.editor.highlight = "#3F3F3F"
	colors.editor.disabled = "#474747"
	colors.editor.accent = "#FF9800"
elseif vim.g.material_style == "lighter" then
	applyGroup = "default"
	-- Lighter theme style
	colors.main = materialMain

	if high_visibility.lighter then
		-- Lighter theme style with high contrast
		colors.editor.fg = "#213B47" -- 20% darkened
		colors.editor.fg_dark = "#61747D" -- 20% darkened
		colors.editor.selection = "#e2e9e9" -- 15% saturation, 10% lightness
		colors.editor.line_numbers = "#B6BFC3" -- 10% darkened
		colors.editor.accent = "#0089A1" -- 20% darkened
		colors.syntax.comments = "#778C96" -- 20% darkened

		colors.main.red = "#B20602" -- 20% darkened
		colors.main.green = "#5E8526" -- 20% darkened
		colors.main.yellow = "#C37101" -- 20% darkened
		colors.main.blue = "#2E4F85" -- 20% darkened
		colors.main.paleblue = "#54637D" -- 20% darkened
		colors.main.cyan = "#067A82" -- 20% darkened
		colors.main.purple = "#491ACC" -- 20% darkened
		colors.main.orange = "#C43A14" -- 20% darkened
		colors.main.pink = "#CC203D" -- 20% darkened
	else
		-- default Lighter theme style
		colors.editor.fg = "#546E7A"
		colors.editor.fg_dark = "#94A7B0"
		colors.editor.selection = "#80CBC4"
		colors.editor.line_numbers = "#CFD8DC"
		colors.editor.accent = "#00BCD4"
		colors.syntax.comments = "#AABFC9"

		colors.main.red = "#E53935"
		colors.main.green = "#91B859"

		colors.main.yellow = "#F6A434"
		colors.main.blue = "#6182B8"
		colors.main.paleblue = "#8796B0"
		colors.main.cyan = "#39ADB5"
		colors.main.purple = "#7C4DFF"
		colors.main.orange = "#F76D47"
		colors.main.pink = "#FF5370"
	end

	colors.editor.bg = "#FAFAFA"
	colors.editor.bg_alt = "#FFFFFF"
	colors.editor.contrast = "#EEEEEE"
	colors.editor.active = "#E7E7E8"
	colors.editor.border = "#D3E1E8"
	colors.editor.highlight = "#E7E7E8"
	colors.editor.disabled = "#D2D4D5"
	colors.editor.cursor = "#272727"

	colors.editor.white = "#FFFFFF"
	colors.editor.gray = "#717CB4"
	colors.editor.title = colors.main.black
elseif vim.g.material_style == "palenight" then
	-- Palenight theme style
	colors.main = materialMain
	applyGroup = "default"

	colors.editor.bg = "#292D3E"
	colors.editor.bg_alt = "#1B1E2B"
	colors.editor.fg = "#A6ACCD"
	colors.editor.fg_dark = "#717CB4"
	colors.editor.selection = "#444267"
	colors.editor.contrast = "#202331"
	colors.editor.active = "#414863"
	colors.editor.border = "#364367"
	colors.editor.line_numbers = "#3A3F58"
	colors.editor.highlight = "#444267"
	colors.editor.disabled = "#515772"
	colors.editor.accent = "#AB47BC"
	colors.editor.none = "NONE"
	colors.syntax.comments = "#676E95"

-- ──────────────────────────────────────────────────────────────────────
elseif vim.g.material_style == "spacedust" then -- ── SPACEDUST ─────────
	applyGroup = "default"
	colors.main = spacedustMain

	colors.editor = { link = "#dec264", cursor = "#708284", title = "#F0F1CE" }
	colors.lsp = { error = "#E35B00" }
	colors.editor.bg = "#0A1E24"
	colors.backgrounds.sidebars = {}

	colors.editor.bg_alt = "#0A385C" -- selection-background
	colors.editor.fg = "#ECF0C1"
	-- colors.editor.fg_darker    = "#8DA3CA" -- TODO
	colors.editor.fg_dark = "#D8CC80" -- guess
	colors.editor.selection = "#FFF6DE"
	colors.editor.contrast = "#684c31" --"#090B10"
	colors.editor.active = "#002831"
	colors.editor.border = "#232637"
	colors.editor.line_numbers = "#aB9a5b"
	colors.editor.highlight = "#1a3f6c"
	colors.editor.disabled = "#464B5D"
	colors.editor.accent = "#e35b00"
	colors.syntax.comments = "#537784"

-- ──────────────────────────────────────────────────────────────────────
elseif vim.g.material_style == "spacedust pro" then -- ── SPACEDUST-PRO ─
	applyGroup = "alternate" -- set syntax color assigns

	local spacedust_pro = {
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
	}

	colors.main = spacedust_pro
	colors.editor = { link = "#dec264", cursor = "#80a2a4", title = "#c0bb8E" }
	colors.lsp = { error = "#ef7358" }
	colors.editor.bg = "#121f22" --"#1c2a2f"
	colors.backgrounds.sidebars = {}

	colors.editor.bg_alt = "#0A385C" -- selection-background
	colors.editor.fg = "#EEE6B5"
	-- colors.editor.fg_darker    = "#8DA3CA" -- TODO
	colors.editor.fg_dark = "#D8CC80" -- guess
	colors.editor.selection = "#bFb69E"
	colors.editor.contrast = "#583c2a" --"#090B10"
	colors.editor.active = "#002831"
	colors.editor.border = "#434657"
	colors.editor.line_numbers = "#b49349"
	colors.editor.highlight = "#1a506c"
	colors.editor.disabled = "#464B5D"
	colors.editor.accent = "#ef584C"
	colors.syntax.comments = "#7f7a65"

-- ──────────────────────────────────────────────────────────────────────
elseif vim.g.material_style == "dusty" then -- ── DUSTY ─────────────────
	local dusty = {
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
	}

	applyGroup = "defaultSidebar"
	colors.main = dusty
	--colors.editor = { link = "#dec264", cursor = "#708284", title = "#c0bb8E" }
	colors.editor.link = "#ded284"
	colors.editor.cursor = "#b0aaa8"
	colors.editor.title = "#c0bb8E"

	colors.lsp = { error = "#ef7358" }
	colors.editor.bg = "#1a232a"
	colors.backgrounds.bg_blend = "#07191c"
	colors.backgrounds.sidebars = "#07191c"

	colors.editor.bg_alt = "#0A385C" -- selection-background
	colors.editor.fg = "#dccfbf"
	-- colors.editor.fg_darker    = "#8DA3CA" -- TODO
	colors.editor.fg_dark = "#bcaf80" -- guess
	colors.editor.selection = "#7f4455"
	colors.editor.contrast = "#583c2a" --"#090B10"
	colors.editor.active = "#002c33"
	colors.editor.border = "#3f5f64"
	colors.editor.line_numbers = "#ba9f66"
	colors.editor.highlight = "#1a506c"
	colors.editor.disabled = "#464B5D"
	colors.editor.accent = "#f06a5a"
	colors.syntax.comments = "#4f847f"

-- ──────────────────────────────────────────────────────────────────────
elseif vim.g.material_style == "fpwst" then -- ── fpwst ─────────────────
	applyGroup = "poopy"

	colors.main = shit_main
	colors.editor = { link = "#336699", cursor = "#8f9fb4", title = "#88aaa5" }
	colors.lsp = { error = "#ef7358" }
	colors.editor.bg = "#131419" --"#191a1f"
	colors.backgrounds.sidebars = {}

	colors.editor.bg_alt = "#1b2835" -- Selection or line cursor is on? -- seems like neither
	colors.editor.fg = "#b4c0c4"
	colors.editor.fg_darker = "#647084"
	colors.editor.fg_dark = "#8fa8c8" -- color of like methods, etc
	colors.editor.selection = "#16362f" -- what is this for then
	colors.editor.contrast = "#583c2a"
	colors.editor.active = "#222332"
	colors.editor.border = "#41434f"
	colors.editor.line_numbers = "#405a6f"
	colors.editor.highlight = "#1a506c"
	colors.editor.disabled = "#464B5D"
	colors.editor.accent = "#438f55"
	colors.syntax.comments = "#4f6072"
elseif vim.g.material_style == "monokai-machine" then
	applyGroup = "monokai"
	colors.main = monokai_machine_main

	colors.editor.bg = "#272822"
	colors.editor.bg_alt = "#1A1A1A" -- Selection or line cursor is on? -- seems like neither
	colors.editor.fg = colors.main.white
	colors.editor.fg_dark = "#8C8B8B" -- color of like methods, etc
	colors.editor.selection = "#878b91" -- what is this for then
	colors.editor.contrast = "#1A1A1A"
	colors.editor.active = "#414339"
	colors.editor.border = "#34352f"
	colors.editor.line_numbers = "#90908a" -- #c2c2bf if that one is shit (it looks shit)
	colors.editor.highlight = "#3F3F3F"
	colors.editor.disabled = "#474747"
	colors.editor.accent = "#FF9800" -- Active Line LineNum, maybe used for statusbar

	colors.editor.fg_darker = "#647084"
	colors.syntax.comments = "#4f6072"
	colors.editor.link = "#ba5db0"
	colors.editor.cursor = "#f8f8f0"
	colors.editor.title = "#f8f8f2"

	colors.lsp = { error = "#90274a" }
	colors.backgrounds.sidebars = {}
	-- b8c4c3, 8b9798, 6b7678, 545f62, 454f53, 273136, 1D2528, 161a1d
	-- elseif vim.g.material_style == "grail" then
else
	vim.g.material_style = "oceanic"
	-- Oceanic theme style

	colors.editor.bg = "#25363B"
	colors.editor.bg_alt = "#1C2C30"
	colors.editor.fg = "#B0BEC5"
	colors.editor.fg_dark = "#7C9EAD"
	-- colors.editor.fg_dark      = "#4B504F"
	colors.editor.selection = "#395B65"
	colors.editor.border = "#355058"
	colors.editor.line_numbers = "#426367"
	colors.editor.highlight = "#354A51" -- highlight
	colors.editor.disabled = "#3E5F64"
	colors.editor.accent = "#11bba3"
	colors.editor.contrast = "#1E272C"
	colors.editor.active = "#314549"
	colors.syntax.comments = "#546E7A"
end

if applyGroup == "alternate" then
	---syntax colors
	colors.syntax.variable = colors.editor.fg
	colors.syntax.field = colors.editor.fg
	colors.syntax.keyword = colors.main.red
	colors.syntax.value = colors.main.orange
	colors.syntax.operator = colors.main.orange
	colors.syntax.fn = colors.main.blue
	colors.syntax.parameter = colors.main.paleblue
	colors.syntax.string = colors.main.green
	colors.syntax.type = colors.main.green

	---git colors
	colors.git.added = colors.main.green
	colors.git.removed = colors.main.red
	colors.git.modified = colors.main.blue

	---lsp colors
	colors.lsp.warning = colors.main.yellow
	colors.lsp.info = colors.main.paleblue
	colors.lsp.hint = colors.main.purple

	---contrasted backgrounds
	colors.backgrounds.sidebars = colors.editor.bg
	colors.backgrounds.floating_windows = colors.editor.bg
	colors.backgrounds.non_current_windows = colors.editor.bg
	colors.backgrounds.bg_blend = colors.editor.bg -- backup used for blending backgrounds (issue: #212)
	colors.backgrounds.cursor_line = colors.editor.active
elseif applyGroup == "poopy" then
	---syntax colors
	colors.syntax.variable = colors.main.green
	colors.syntax.field = colors.editor.fg
	colors.syntax.keyword = colors.main.purple
	colors.syntax.value = colors.main.yellow
	colors.syntax.operator = colors.main.orange
	colors.syntax.fn = colors.main.red
	colors.syntax.parameter = colors.main.green
	colors.syntax.string = colors.main.paleblue
	colors.syntax.type = colors.main.red

	---git colors
	colors.git.added = colors.main.green
	colors.git.removed = colors.main.red
	colors.git.modified = colors.main.blue

	---lsp colors
	colors.lsp.warning = colors.main.yellow
	colors.lsp.info = colors.main.paleblue
	colors.lsp.hint = colors.main.purple

	---contrasted backgrounds
	colors.backgrounds.sidebars = colors.editor.bg
	colors.backgrounds.floating_windows = colors.editor.bg
	colors.backgrounds.non_current_windows = colors.editor.bg
	colors.backgrounds.bg_blend = colors.editor.bg -- backup used for blending backgrounds (issue: #212)
	colors.backgrounds.cursor_line = colors.editor.active
elseif applyGroup == "monokai" then
	-- MONKONAI PRO USE
	colors.syntax.variable = colors.editor.fg
	colors.syntax.field = colors.editor.purple
	colors.syntax.keyword = colors.main.red
	colors.syntax.value = colors.main.purple
	colors.syntax.operator = colors.main.red
	colors.syntax.fn = colors.main.green
	colors.syntax.parameter = colors.main.darkyellow
	colors.syntax.string = colors.main.yellow
	colors.syntax.type = colors.main.blue

	---git colors
	colors.git.added = colors.main.green
	colors.git.removed = colors.main.red
	colors.git.modified = colors.main.blue

	---lsp colors
	colors.lsp.warning = colors.main.yellow
	colors.lsp.info = colors.main.paleblue
	colors.lsp.hint = colors.main.purple

	---contrasted backgrounds
	colors.backgrounds.sidebars = colors.editor.bg
	colors.backgrounds.floating_windows = colors.editor.bg
	colors.backgrounds.non_current_windows = colors.editor.bg
	colors.backgrounds.bg_blend = colors.editor.bg -- backup used for blending backgrounds (issue: #212)
	colors.backgrounds.cursor_line = colors.editor.active
elseif applyGroup == "defaultSidebar" then
	---syntax colors
	colors.syntax.variable = colors.editor.fg
	colors.syntax.field = colors.editor.green
	colors.syntax.keyword = colors.main.purple
	colors.syntax.value = colors.main.orange
	colors.syntax.operator = colors.main.cyan
	colors.syntax.fn = colors.main.blue
	colors.syntax.parameter = colors.main.paleblue
	colors.syntax.string = colors.main.green
	colors.syntax.type = colors.main.purple

	---git colors
	colors.git.added = colors.main.green
	colors.git.removed = colors.main.red
	colors.git.modified = colors.main.blue

	---lsp colors
	colors.lsp.warning = colors.main.yellow
	colors.lsp.info = colors.main.paleblue
	colors.lsp.hint = colors.main.purple

	---contrasted backgrounds
	--colors.backgrounds.sidebars = colors.editor.bg
	colors.backgrounds.floating_windows = colors.editor.bg
	colors.backgrounds.non_current_windows = colors.editor.bg
	--colors.backgrounds.bg_blend = colors.editor.bg -- backup used for blending backgrounds (issue: #212)
	colors.backgrounds.cursor_line = colors.editor.active
else --default
	applyGroup = "default"
	---syntax colors
	colors.syntax.variable = colors.editor.fg
	colors.syntax.field = colors.editor.fg
	colors.syntax.keyword = colors.main.purple
	colors.syntax.value = colors.main.orange
	colors.syntax.operator = colors.main.cyan
	colors.syntax.fn = colors.main.blue
	colors.syntax.parameter = colors.main.paleblue
	colors.syntax.string = colors.main.green
	colors.syntax.type = colors.main.purple

	---git colors
	colors.git.added = colors.main.green
	colors.git.removed = colors.main.red
	colors.git.modified = colors.main.blue

	---lsp colors
	colors.lsp.warning = colors.main.yellow
	colors.lsp.info = colors.main.paleblue
	colors.lsp.hint = colors.main.purple

	---contrasted backgrounds
	colors.backgrounds.sidebars = colors.editor.bg
	colors.backgrounds.floating_windows = colors.editor.bg
	colors.backgrounds.non_current_windows = colors.editor.bg
	colors.backgrounds.bg_blend = colors.editor.bg -- backup used for blending backgrounds (issue: #212)
	colors.backgrounds.cursor_line = colors.editor.active
end

--[[ TODO: Delete above if statement and un-comment below when implementation complete.
local grp = require('material.colors.apply_groups')
grp.make_groups(colors)
grp.apply_group(colors,applyGroup) 
--]]

return colors
