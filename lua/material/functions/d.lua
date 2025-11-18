local M = { c = {}, t = {} }

local fn = require("material.functions")
local cc = fn.cc

--- given a table of rgb values, returns the lum value
---@param rgb table[number] indexed r,g,b table
---@return number # lum value
local lum = function(rgb)
	return 0.299 * rgb[0] + 0.587 * rgb[1] + 0.114 * rgb[2]
end

---returns { fg = color } if color is not nil, else returns nil
function M.fg(color)
	if color == nil then
		return nil
	end
	return { fg = color }
end

---returns { fg = color } if color is not nil, else returns { link = linkto }
---@param color string|nil
---@param linkto string
---@return table
function M.fg_or_link(color, linkto)
	return M.fg(color) or { link = linkto }
end

M.link_or_fg = function(linkto, color)
	if linkto and linkto ~= "" and vim.fn.hlexists(linkto) == 1 then
		return { link = linkto }
	else
		return M.fg(color)
	end
end

--- returns the lighter color if the background is dark, else returns the darker color
---@param lc string | any # light color
---@param dc string | any # dark color
---@param bg string # bg color hex string
---@return any
M.selectContrasting = function(lc, dc, bg)
	local bgval = cc.color2rgb(bg)
	if lum(bgval) < 0.5 then
		return lc
	else
		return dc
	end
end

-- ── Color math functions ────────────────────────────────────────────

local bclamp = function(n)
	if n < 0 then
		return 0
	elseif n > 255 then
		return 255
	else
		return n
	end
end

function M.t.all_vals_are(tbl, typestr)
	if type(tbl) ~= "table" or type(typestr) ~= "string" then
		return false
	end
	local bool = true
	for _, v in pairs(tbl) do
		bool = bool and type(v) == typestr
	end
	return bool
end

---Given a hexstring [color] and a number/table, adds values uniformly or individually to the rgb components.
---By default, adds -8 to r,g, and b values.
---RETURNS hex-RGB string result (ex. "#0F0F0F"). On failure, returns the original colorval
---@param colorval any
---@param add any
---@return string
function M.c.addcolor(colorval, add)
	vim.print("bringo")
	local a = { r = -8, g = -8, b = -8 }
	if add then
		if type(add) == "number" then
			a.r, a.g, a.b = add, add, add
		elseif type(add) == "table" then
			local addrgb = M.c.try_rgb_table(add)
			if addrgb then
				a = addrgb
			end
		end
	end
	if type(colorval) == "string" then
		local cnum = tonumber(colorval:sub(2), 16)
		local r = math.floor(cnum / 0x10000)
		local g = math.floor(cnum / 0x100) % 0x100
		local b = cnum % 0x100
		return ("#%02x%02x%02x"):format(bclamp(r + a.r), bclamp(g + a.g), bclamp(b + a.b))
	end
	return colorval
end

return M
