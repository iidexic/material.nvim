local M = {}

local n = 0

M._tcompare = function(t1, t2, prefix)
	if prefix and prefix ~= "" then
		prefix = prefix .. "."
	end
	local c = ""
	n = n + 1
	if n > 10 then
		return "((too deep I did my best))"
	end
	if vim.deep_equal(t1, t2) then
		return "Tables are equal"
	end

	for k, v in pairs(t1) do
		local tv = type(v)
		local name = prefix .. k
		if not t2[k] then
			c = c .. "\n" .. name .. " not found in t2"
		else
			local t2v = type(t2[k])
			if tv == "table" and t2v == "table" then
				c = c .. "\n" .. M._tcompare(v, t2[k], name)
			elseif tv ~= t2v then
				c = c .. "\n(" .. name .. ")  type mistmatch: " .. tv .. " != " .. t2v
			elseif v ~= t2[k] then
				c = c .. "\n(" .. name .. ")  value mismatch: " .. v .. " != " .. t2[k]
			end
		end
	end
	return c
end

M.compareTables = function(t1, t2)
	n = 0
	local c = "TABLE COMPARISON:"
	c = c .. "\n" .. M._tcompare(t1, t2, "")
	return c
end

return M
