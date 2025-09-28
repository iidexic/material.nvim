---# Colors - init populated for default value/backup
local C = {}
local colors = {
	main = {
		white = "#fffaf3",
		gray = "#8a8089",
		black = "#0a181c",
		red = "#f0696a",
		green = "#8aea9a",
		yellow = "#ffcb6b",
		blue = "#70b8fa",
		paleblue = "#9ad0ff",
		cyan = "#80e8e8",
		purple = "#a890ef",
		orange = "#f07a68",
		pink = "#fa8acf",

		darkred = "#ca404f",
		darkgreen = "#409D4C",
		darkyellow = "#d6a445",
		darkblue = "#3e6aa4",
		darkcyan = "#01a6b7",
		darkpurple = "#5a3cbf",
		darkorange = "#b56055",
	},
}

C.style = {}

C.style.main = {
	oceanic = {}, -- main table above, base colors
}

local apply = C.style.apply
apply.oceanic = {
	editor = {},
	syntax = {},
	lsp = {},
}

---Get names of all styles that can be applied
---@return table<string> # table of style names/keys
function C.AvailableStyles()
	local names = {}
	for k in ipairs(C.style) do
		table.insert(names, k)
	end
	return names
end

function C.SetStyle(style, modtable) end

return C
