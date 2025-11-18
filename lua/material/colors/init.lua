local high_visibility = require("material.util.config").settings.high_visibility
local main_groups = require("material.colors.main_groups")
local apply_groups = require("material.colors.apply_groups")

---styles table (can be made less complicated pretty easily)
local styles = {
	sleek = { "sleek", apply_id = "sleek" },
	lighter = { "default", apply_id = "default", highvis = "lighter_highvis" },
	omni2 = { "omni2", apply_id = "monokai" },
	spacedust = { "spacedust", apply_id = "default" },
	spacedust_pro = { "spacedust_pro_alt", apply_id = "alternate" },
	dusty = { "dusty", apply_id = "dusty" },
	dirty = { "dirty", apply_id = "dirty" },
	fpwst = { "fpwst", apply_id = "poopy" },
	monokai_machine = { "monokai_machine", apply_id = "monokai" },
	inferno = { "inferno", apply_id = "warm" },
	xxx = { "xxx", apply_id = "xxx" },
	xxl = { "xxl", apply_id = "xxx" },
	halesy = { "halesy", apply_id = "halesy" },
	deusmaster = { "deusmaster", apply_id = "deusmaster" },
	perfected = { "perfected", apply_id = "perfected" },
}

---colors table
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
---colors applied to the editor
colors.editor = { link = "#dec264", cursor = "#708284", title = "#F0F1CE" }
colors.lsp = { error = "#E35B00" }
colors.syntax = {}
colors.git = {}
colors.backgrounds = {}

-- ──────────────────────────────────────────────────────────────────────
-- ╭─────────────────────────────────────────────────────────╮
-- │                     BUILDING COLORS                     │
-- ╰─────────────────────────────────────────────────────────╯
local style_id = vim.g.material_style
local selected = nil

-- Get named style or default (darker)
if styles[style_id] then
	selected = styles[style_id]
else
	selected = styles.darker
end

local mainID = selected[1]
local applyID = selected.apply_id
colors = main_groups.load_style(colors, mainID)
colors = apply_groups.apply(colors, applyID)

-- lazy
if high_visibility and selected["highvis"] then
	colors = main_groups.load_edit_group(colors, selected.highvis)
end

-- okay now we make the other shit

return colors
