-- apply default/fallback colors table
local colors = {}
colors.main = {
	white = "#eeffff",
	gray = "#717cb4",
	black = "#000000",
	red = "#f07178",
	green = "#c3e88d",
	yellow = "#ffcb6b",
	blue = "#82aaff",
	paleblue = "#b0c9ff",
	cyan = "#99ddff",
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
}
colors.editor = { link = "#dec264", cursor = "#708284", title = "#F0F1CE" }
colors.lsp = { error = "#E35B00" }
colors.syntax = {}
colors.git = {}
colors.backgrounds = {}

-- ╭──────────────────────────── APPLY STYLE ────────────────────────────╮
local style_id = vim.g.material_style or "minimal"
local stylereq = "material.colors.styles." .. style_id
package.loaded[stylereq] = nil
colors = require(stylereq).apply(colors)
-- ╰─────────────────────────────────────────────────────────────────────╯
--NOTE: This setup adds a few duplicate lines (deep extends) to the style file's apply function.
--	Overall it's still better and easier to manage than my previous method.

return colors
