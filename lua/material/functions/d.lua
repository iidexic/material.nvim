local M = {}

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

return M
