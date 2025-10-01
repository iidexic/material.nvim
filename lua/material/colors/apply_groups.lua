local M = {}

M.existing_groups = {
	"default",
	"alternate",
	"poopy",
}
local groups = {}

--- Requires colors table to generate style groups
function M.make_groups(colors)
	groups.default = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.purple,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	groups.defaultSidebar = {
		editor = {
			variable = colors.editor.fg,
			field = colors.editor.green,
			keyword = colors.main.purple,
			value = colors.main.orange,
			operator = colors.main.cyan,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
		},
		syntax = {
			type = colors.main.purple,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = { -- function to check if sidebar currently bg?
			floating_windows = colors.editor.bg,
			--sidebars = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	groups.alternate = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.fg,
			keyword = colors.main.red,
			value = colors.main.orange,
			operator = colors.main.orange,
			fn = colors.main.blue,
			parameter = colors.main.paleblue,
			string = colors.main.green,
			type = colors.main.green,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	groups.poopy = {
		syntax = {
			variable = colors.main.green,
			field = colors.editor.fg,
			keyword = colors.main.purple,
			value = colors.main.yellow,
			operator = colors.main.orange,
			fn = colors.main.red,
			parameter = colors.main.green,
			string = colors.main.paleblue,
			type = colors.main.red,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg, -- backup used for blending backgrounds (issue: #212)
			cursor_line = colors.editor.active,
		},
	}
	groups.monokai = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.purple,
			keyword = colors.main.red,
			value = colors.main.purple,
			operator = colors.main.red,
			fn = colors.main.green,
			parameter = colors.main.darkyellow,
			string = colors.main.yellow,
			type = colors.main.blue,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.purple,
		},
		backgrounds = {
			sidebars = colors.editor.bg,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	groups.warm = {
		syntax = {
			variable = colors.editor.fg,
			field = colors.editor.yellow,
			keyword = colors.main.red,
			value = colors.main.blue,
			operator = colors.main.red,
			fn = colors.main.green,
			parameter = colors.main.orange,
			string = colors.main.cyan,
			type = colors.main.darkred,
		},
		git = {
			added = colors.main.green,
			removed = colors.main.red,
			modified = colors.main.blue,
		},
		lsp = {
			warning = colors.main.yellow,
			info = colors.main.paleblue,
			hint = colors.main.blue,
		},
		backgrounds = {
			sidebars = colors.editor.black,
			floating_windows = colors.editor.bg,
			non_current_windows = colors.editor.bg,
			bg_blend = colors.editor.bg,
			cursor_line = colors.editor.active,
		},
	}
	M.groups = groups
end
---sets how colors are applied to vim highlight groups
---@param colors table colors table to apply to
---@param id string name of apply group
function M.apply(colors, id)
	if groups[id] then
		return vim.tbl_deep_extend("force", colors, groups[id])
	end
	return vim.tbl_deep_extend("force", colors, groups.default)
end

return M
