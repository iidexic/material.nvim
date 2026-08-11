local M = {}

M.apply = function(style_name, colors)
	local style = require("material.colors.styles." .. style_name)
	vim.tbl_deep_extend("force", colors, style.colors)
	vim.tbl_deep_extend("force", colors, style.apply(colors))
	return colors
end

return M
