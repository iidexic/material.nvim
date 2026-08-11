local M = {}

M.apply = function(style_name, colors)
	local style = require("d.colors.styles." .. style_name)
	vim.tbl_deep_extend("force", colors, style.colors)
	vim.tbl_deep_extend("force", colors, style.apply(colors))
	return colors
end

return M
