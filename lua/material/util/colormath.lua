local M = { c = {}, t = {} }

function M.badd(n, amt)
	n = n + amt
	if n > 255 then
		n = 255
	end
	if n < 0 then
		n = 0
	end
	return n
end

-- function M.totlen(tbl)
-- 	if type(tbl) == "table" then
-- 		local n = 0
-- 		for _, _ in pairs(tbl) do
-- 			n = n + 1
-- 		end
-- 		return n
-- 	end
-- 	return nil
-- end

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

--- Given a table, returns a table with keys r, g, and b, with number values.
--- return table is unbound/not clamped
function M.c.try_rgb_table(tbl)
	if tbl["r"] and tbl["g"] and tbl["b"] then
		local rgb = { r = tbl.r, g = tbl.g, b = tbl.b }
		if M.t.all_vals_are(rgb, "number") then
			return rgb
		end
	elseif table.maxn(tbl) == 3 and M.t.all_vals_are(tbl, "number") then
		return { r = tbl[1], g = tbl[2], b = tbl[3] }
	end
	return nil
end

function M.c.hexstr_to_rgb(hexstr)
	if type(hexstr) == "string" then
		local hlen = hexstr:len()
		local cnum = nil
		if hlen == 7 then
			cnum = tonumber(hexstr:sub(2), 16)
		elseif hlen == 6 then
			cnum = tonumber(hexstr, 16)
		end
		if cnum then
			local rgb = {
				r = math.floor(cnum / 0x10000),
				g = math.floor(cnum / 0x100) % 0x100,
				b = cnum % 0x100,
			}
			return rgb
		end
	end
	return nil -- superfluous?
end

---Given a form of color value, returns a table with keys "r","g","b" with valid single-byte color values
---IF GIVEN table, result is unbound
---IF GIVEN hex string, result is inherently bound
---Otherwise, returns nil
---@param color table|string
---@return table|nil
function M.c.color2rgb(color)
	if type(color) == "table" then
		local rgb = M.c.try_rgb_table(color)
		if rgb then
			return rgb
		end
	elseif type(color) == "string" then
		local rgb = M.c.hexstr_to_rgb(color)
		if rgb then
			return rgb
		end
	end
	return nil
end

---Given a hexstring [color] and a number/table, adds values uniformly or individually to the rgb components.
---By default, adds -8 to r,g, and b values.
---RETURNS hex-RGB string result (ex. "#0F0F0F"). On failure, returns the original colorval
---@param color any
---@param add any
---@return string
function M.c.addcolor(color, add)
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
	if type(color) == "string" then
		local cnum = tonumber(color:sub(2), 16)
		local r = math.floor(cnum / 0x10000)
		local g = math.floor(cnum / 0x100) % 0x100
		local b = cnum % 0x100
		return ("#%02x%02x%02x"):format(M.badd(r, a.r), M.badd(g, a.g), M.badd(b, a.b))
	end
	return color
end

return M
