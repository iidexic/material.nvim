local colors = require("material.colors")
-- Why do we do require colors and then just change colors to conditionals
colors = require("material.colors.conditionals")

local m = colors.main
local e = colors.editor
local g = colors.git
local l = colors.lsp
local s = colors.syntax
local b = colors.backgrounds

local syntax_hls = {
	Identifier = { fg = s.variable },
	Comment = { fg = s.comments },
	Keyword = { fg = s.keyword },
	Conditional = { fg = s.keyword },
	Function = { fg = s.fn },
	Repeat = { fg = s.keyword },
	String = { fg = s.string },
	Type = { fg = s.type },
	StorageClass = { fg = m.cyan }, -- static, register, volatile, etc.
	Structure = { fg = s.type },
	SpecialComment = { link = "Comment" }, -- special things inside a comment
	Constant = { fg = m.yellow },
	Number = { fg = s.value },
	Character = { link = "Number" },
	Boolean = { link = "Number" },
	Float = { link = "Number" },
	Statement = { fg = m.cyan },
	Label = { fg = s.keyword }, -- case, default, etc.
	Operator = { fg = s.operator },
	Exception = { fg = m.red },
	Macro = { fg = m.cyan },
	Include = { link = "Macro" },
	-- Define         = { link = "Macro" },
	-- PreProc        = { link = "Macro" },
	-- PreCondit   = { link = "Macro" },
	Typedef = { fg = m.red },
	Special = { fg = m.cyan },
	SpecialChar = { fg = m.red },
	Tag = { fg = m.red },
	Delimiter = { fg = s.operator }, -- ;
	Debug = { fg = m.red },
	htmlLink = { fg = e.link, underline = true },
	-- htmlH1         = { fg = m.cyan, bold = true },
	-- htmlH2         = { fg = m.red, bold = true },
	-- htmlH3         = { fg = m.green, bold = true },
}
