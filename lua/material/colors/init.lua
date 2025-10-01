local high_visibility = require("material.util.config").settings.high_visibility
local main_groups = require("material.colors.main_groups")
local apply_groups = require("material.colors.apply_groups")

---styles table (can be made less complicated pretty easily)
local styles = {
	darker = { "darker", apply_id = "default", highvis = "darker_highvis" },
	lighter = { "default", apply_id = "default", highvis = "lighter_highvis" },
	spacedust = { "spacedust", apply_id = "default" },
	spacedust_pro = { "spacedust_pro", apply_id = "alternate" },
	dusty = { "dusty", apply_id = "defaultSidebar" },
	fpwst = { "fpwst", apply_id = "poopy" },
	monokai_machine = { "monokai_machine", apply_id = "monokai" },
	inferno = { "inferno", apply_id = "warm" },
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

colors = main_groups.load_main(colors, mainID)
main_groups.make_edit_groups(colors)
colors = main_groups.load_edit_group(colors, mainID)
apply_groups.make_groups(colors)
colors = apply_groups.apply(colors, applyID)
if high_visibility and selected["highvis"] then
	colors = main_groups.load_edit_group(colors, selected.highvis)
end

return colors
