local colors = require("material.colors")
local settings = require("material.util.config").settings
local plugins = require("material.highlights.plugins")
local functions = require("material.functions")
local styles = settings.styles
--TODO: HIGHEST PRIORITY: Gotta re-write some shit over here
--
-- apply conditional colors
colors = require("material.colors.conditionals")

local d = require("material.functions.d")

local m = colors.main
local e = colors.editor
local g = colors.git
local l = colors.lsp
local s = colors.syntax
local b = colors.backgrounds
-- colors = require("material.colors.conditionals")
-- local customhl = require("material.colors.alt_hl")
-- vim.print(customhl.style_highlights(colors))

local M = {}

---main highlight functions
M.main_highlights = {}

---async highlight functions
M.async_highlights = {}

---regular Vim syntax highlights
M.main_highlights.syntax = function()
	local syntax_hls = {
		StorageClass = { fg = s.storageClass or m.cyan }, --(cyan) static, register, volatile, etc.
		Statement = { fg = s.statement or m.cyan }, -- cyan
		Identifier = { fg = s.variable },
		Comment = { fg = s.comments },
		Keyword = { fg = s.keyword },
		KeywordType = { fg = s.keyword_type or s.keyword },
		Conditional = { fg = s.conditional or s.keyword },

		Function = { fg = s.fn },
		FunctionBuiltin = { fg = s.builtin_fn or s.fn },
		FunctionCall = { fg = s.fn_call or s.fn },
		FunctionMethod = { fg = s.fn_method or s.fn },
		FunctionMethodCall = { fg = s.fn_method_call or s.fn_call or s.fn },
		Repeat = { fg = s.repeat_keyword or s.keyword },
		String = { fg = s.string }, -- string + rune
		Type = { fg = s.type }, -- no go
		Structure = { fg = s.type }, -- no go
		SpecialComment = d.fg_or_link(s.specialComment, "Comment"), -- special things inside a comment
		-- ──────────────────────────────── NEW ────────────────────────────────
		VarMember = { fg = s.member or e.fg_dark }, -- yellow
		VarParam = d.fg_or_link(s.parameter, "Identifier"), -- yellow
		VarBuiltin = d.fg_or_link(s.builtin_var, "Identifier"),
		-- ─────────────────────────────────────────────────────────────────────
		Constant = { fg = s.const or m.yellow }, -- yellow
		ConstBuiltin = d.fg_or_link(s.builtin_const, "Constant"),
		Number = { fg = s.value },
		Character = { link = "Number" }, -- no go
		Boolean = d.fg_or_link(s.boolean, "Number"),
		Float = d.fg_or_link(s.float, "Number"),
		Label = { fg = s.label or s.keyword or m.yellow }, -- (no go?) case, default, etc.
		Operator = { fg = s.operator },
		Exception = { fg = s.exception or m.red },
		Macro = { fg = m.cyan }, -- cyan
		Include = { link = "Macro" },
		-- Define = { link = "Macro" }, PreProc = { link = "Macro" }, PreCondit = { link = "Macro" },
		Typedef = { fg = s.typedef or m.red },
		Typequal = { fg = s.typequal or m.cyan },
		Special = { fg = s.special or m.cyan }, -- cyan
		SpecialChar = { fg = s.specialChar or m.red }, -- red
		Delimiter = { fg = s.delimiter or s.operator }, -- ;
		Tag = { fg = s.tag or m.red }, -- red
		Debug = { fg = m.red }, -- red
		htmlLink = { fg = e.link, underline = true },

		-- ── [More New] ──────────────────────────────────────────────────────
		Tag_Delimiter = { fg = s.tag_delim or m.cyan }, -- cyan
		Tag_Attribute = { fg = s.tag_attrib or m.purple }, -- purple
		Bracket = { fg = s.bracket or m.blue },
		-- htmlH1={fg=m.cyan,bold=true},htmlH2={fg=m.red,bold=true},htmlH3={fg=m.green,bold=true}
	}

	-- apply the user set styles for these groups
	syntax_hls.Comment = vim.tbl_extend("keep", syntax_hls.Comment, styles.comments)
	syntax_hls.Conditional = vim.tbl_extend("keep", syntax_hls.Conditional, styles.keywords)
	syntax_hls.Function = vim.tbl_extend("keep", syntax_hls.Function, styles.functions)
	syntax_hls.Identifier = vim.tbl_extend("keep", syntax_hls.Identifier, styles.variables)
	syntax_hls.Keyword = vim.tbl_extend("keep", syntax_hls.Keyword, styles.keywords)
	syntax_hls.Repeat = vim.tbl_extend("keep", syntax_hls.Repeat, styles.keywords)
	syntax_hls.String = vim.tbl_extend("keep", syntax_hls.String, styles.strings)
	syntax_hls.Type = vim.tbl_extend("keep", syntax_hls.Type, styles.types)
	syntax_hls.Structure = vim.tbl_extend("keep", syntax_hls.Structure, styles.types)
	syntax_hls.StorageClass = vim.tbl_extend("keep", syntax_hls.StorageClass, styles.keywords)
	syntax_hls.Include = vim.tbl_extend("keep", syntax_hls.Include, styles.keywords)

	return syntax_hls
end

---treesitter highlights
M.main_highlights.treesitter = function()
	if vim.fn.has("nvim-0.8.0") == 1 then
		local treesitter_hls = {
			["@error"] = { link = "Error" },

			["@comment"] = { link = "Comment" },
			["@comment.todo"] = { link = "Comment" }, -- oh
			["@comment.error"] = { fg = s.comments, bg = l.error },
			["@comment.warning"] = { fg = s.comments, bg = l.warning },
			["@comment.hint"] = { fg = s.comments, bg = l.hint },
			["@comment.note"] = { fg = s.comments, bg = l.info },

			["@type"] = { fg = s.type }, -- nogo
			["@type.builtin"] = { fg = s.type_builtin or s.type },
			["@type.definition"] = { link = "Typedef" }, -- nogo
			["@type.qualifier"] = { link = "Typequal" }, --cyan

			["@variable"] = { link = "Identifier" }, -- s.variable (link Identifier)
			-- ["@field"]              = { fg = e.fg_dark },
			-- property: lua table key, go struct field name (not def)
			["@property"] = { fg = s.property or e.fg_dark },
			["@variable.parameter"] = { link = "VarParam" }, --linkid go: func param, structname 4 method
			["@variable.member"] = { link = "VarMember" }, -- struct field def
			["@function"] = { link = "Function" }, -- non-method
			["@function.call"] = { link = "Function" },
			["@function.builtin"] = { link = "FunctionBuiltin" },
			["@function.macro"] = { link = "Function" },
			["@function.method"] = { link = "FunctionMethod" },
			["@function.method.call"] = { link = "FunctionMethodCall" },

			-- constructor: lua: curly brackets, go: ?
			["@constructor"] = { fg = m.blue }, -- blue

			-- why would keyword not be keyword
			["@keyword"] = { fg = s.keyword }, -- cyan
			-- Link @keyword
			["@variable.builtin"] = { link = "@keyword" },
			["@keyword.coroutine"] = { fg = m.cyan, italic = true },
			["@keyword.operator"] = { link = "@keyword" },
			["@keyword.return"] = d.fg_or_link(s.kw_return, "@keyword"), -- return
			["@keyword.function"] = d.fg_or_link(s.kw_func, "@keyword"), -- func
			["@keyword.export"] = d.fg_or_link(s.kw_export, "@keyword"), -- not in go

			["@keyword.conditional"] = { link = "Conditional" },
			["@keyword.repeat"] = { link = "Repeat" },
			["@keyword.import"] = { link = "Include" },
			["@keyword.exception"] = { link = "Exception" },
			["@keyword.type"] = { link = "KeywordType" },

			["@constant"] = { link = "Constant" }, -- yellow
			["@constant.builtin"] = { link = "ConstBuiltin" }, -- yellow
			["@constant.macro"] = { fg = m.cyan }, -- nogo

			["@keyword.directive"] = { fg = m.fg_dark }, -- nogo
			["@macro"] = { fg = m.fg_dark }, -- nogo
			["@module"] = { fg = m.pink }, -- package name only

			["@string"] = { link = "String" },
			["@string.escape"] = { fg = s.string_escape or s.string or m.orange },
			["@string.regexp"] = { fg = m.yellow }, -- nogo
			["@string.special"] = { fg = s.string_escape or e.fg_dark }, -- nogo
			["@string.special.symbol"] = { fg = m.red or m.yellow }, -- nogo
			["@string.documentation"] = { fg = m.pink or m.cyan }, -- nogo

			["@character"] = { link = "Character" }, -- nogo
			["@character.special"] = { link = "SpecialChar" },

			["@diff.plus"] = { link = "DiffAdd" },
			["@diff.minus"] = { link = "DiffDelete" },
			["@diff.delta"] = { link = "DiffChange" },
			["@attribute"] = { link = "DiffChange" },

			-- ["@structure"]             = { fg = s.type },
			["@keyword.storage"] = { fg = m.orange }, -- nogo?

			["@label"] = { link = "Label" }, -- yellow

			["@punctuation"] = { fg = m.cyan }, -- nogo
			["@punctuation.delimiter"] = { link = "Delimiter" }, -- comma, colon, semicolon
			["@punctuation.bracket"] = { link = "Bracket" },
			--d.fg_or_link(m.cyan, "@punctuation.bracket"), -- curly (not lua), square, paren
			["@punctuation.special"] = { fg = m.red }, -- nogo? :(

			["@markup.underline"] = { underline = true },
			["@markup.emphasis"] = { italic = true },
			["@markup.strong"] = { bold = true },
			-- ["@markup.strikethrough"]     = { style = { "strikethrough" } },
			["@markup.title"] = { fg = m.cyan, bold = true },
			["@markup.heading"] = { fg = m.cyan, bold = true },
			["@markup.literal"] = { fg = m.green },
			["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
			["@markup.link.url"] = { fg = e.link }, -- urls, links and emails
			["@markup.math"] = { fg = m.blue }, -- e.g. LaTeX math
			["@markup.raw"] = { fg = m.purple }, -- e.g. inline `code` in Markdown
			["@markup.list"] = { link = "Special" },
			["@markup.list.checked"] = { fg = m.green }, -- checkboxes
			["@markup.list.unchecked"] = { fg = s.text },
			["@markup.environment"] = { fg = m.red },
			["@markup.environment.name"] = { fg = m.red },
			["@markup.warning"] = { fg = l.warning },
			["@markup.danger"] = { fg = l.error },
			["@tag"] = { link = "Tag" }, -- red
			["@tag.delimiter"] = { link = "Tag_Delimiter" }, -- cyan
			["@tag.attribute"] = { link = "Tag_Attribute" }, -- purple
			["@keyword.directive.define"] = { link = "@keyword.directive" },
			["@operator"] = { link = "Operator" },
			TreesitterContext = { bg = e.contrast },
			TreesitterContextLineNumber = { fg = e.line_numbers, bg = e.contrast },

			["@boolean"] = { link = "Boolean" }, -- go boolean
			["@number"] = { link = "Number" }, -- go integer
			["@number.float"] = { link = "Float" }, -- go not lua
		}

		-- Legacy highlights, for backward compatibility
		treesitter_hls["@parameter"] = treesitter_hls["@variable.parameter"]
		treesitter_hls["@field"] = treesitter_hls["@variable.member"]
		treesitter_hls["@namespace"] = treesitter_hls["@module"]
		treesitter_hls["@float"] = treesitter_hls["number.float"]
		treesitter_hls["@symbol"] = treesitter_hls["@string.special.symbol"]
		treesitter_hls["@string.regex"] = treesitter_hls["@string.regexp"]

		treesitter_hls["@text"] = treesitter_hls["@markup"]
		treesitter_hls["@text.strong"] = treesitter_hls["@markup.strong"]
		treesitter_hls["@text.emphasis"] = treesitter_hls["@markup.italic"]
		treesitter_hls["@text.underline"] = treesitter_hls["@markup.underline"]
		treesitter_hls["@text.strike"] = treesitter_hls["@markup.strikethrough"]
		treesitter_hls["@text.uri"] = treesitter_hls["@markup.link.url"]
		treesitter_hls["@text.math"] = treesitter_hls["@markup.math"]
		treesitter_hls["@text.environment"] = treesitter_hls["@markup.environment"]
		treesitter_hls["@text.environment.name"] = treesitter_hls["@markup.environment.name"]

		treesitter_hls["@text.title"] = treesitter_hls["@markup.heading"]
		treesitter_hls["@text.literal"] = treesitter_hls["@markup.raw"]
		treesitter_hls["@text.reference"] = treesitter_hls["@markup.link"]

		treesitter_hls["@text.todo.checked"] = treesitter_hls["@markup.list.checked"]
		treesitter_hls["@text.todo.unchecked"] = treesitter_hls["@markup.list.unchecked"]

		-- @text.todo is now for todo comments, not todo notes like in markdown
		treesitter_hls["@text.todo"] = treesitter_hls["comment.warning"]
		treesitter_hls["@text.warning"] = treesitter_hls["comment.warning"]
		treesitter_hls["@text.note"] = treesitter_hls["comment.note"]
		treesitter_hls["@text.danger"] = treesitter_hls["comment.error"]

		treesitter_hls["@method"] = treesitter_hls["@function.method"]
		treesitter_hls["@method.call"] = treesitter_hls["@function.method.call"]

		treesitter_hls["@text.diff.add"] = treesitter_hls["@diff.plus"]
		treesitter_hls["@text.diff.delete"] = treesitter_hls["@diff.minus"]

		treesitter_hls["@define"] = treesitter_hls["@keyword.directive.define"]
		treesitter_hls["@preproc"] = treesitter_hls["@keyword.directive"]
		treesitter_hls["@storageclass"] = treesitter_hls["@keyword.storage"]
		treesitter_hls["@conditional"] = treesitter_hls["@keyword.conditional"]
		treesitter_hls["exception"] = treesitter_hls["@keyword.exception"]
		treesitter_hls["@include"] = treesitter_hls["@keyword.import"]
		treesitter_hls["@repeat"] = treesitter_hls["@keyword.repeat"]

		treesitter_hls["@keyword"] = vim.tbl_extend("keep", treesitter_hls["@keyword"], styles.keywords)
		treesitter_hls["@keyword.directive"] =
			vim.tbl_extend("keep", treesitter_hls["@keyword.directive"], styles.keywords)

		return treesitter_hls
	else
		local treesitter_hls = {
			TSType = { fg = s.type },
			TSTypeBuiltin = { fg = s.type },

			TSVariableBuiltin = { link = "Identifier" },
			TSField = { fg = e.fg_dark },
			TSSymbol = { fg = m.yellow },

			TSFuncBuiltin = { fg = s.fn },
			TSFuncMacro = { link = "Function" },
			TSConstructor = { link = "Function" },

			TSKeyword = { fg = m.cyan },

			TSConstant = { fg = m.yellow },
			TSConstantBuiltin = { fg = m.yellow },
			TSConstantMacro = { fg = m.cyan },

			TSMacro = { fg = m.cyan },
			TSNamespace = { fg = m.yellow },

			TSStringEscape = { fg = e.fg_dark },
			TSStringRegex = { fg = m.yellow },
			TSStringSpecial = { fg = e.fg_dark },

			TSPunct = { fg = m.cyan },
			TSPunctDelimiter = { fg = m.cyan },
			TSPunctBracket = { fg = e.title },
			TSURI = { fg = e.link },
			TSTag = { fg = m.red },
			TSTagDelimiter = { fg = m.cyan },
			TSTagAttribute = { fg = m.purple },
			TSTodo = { fg = colors.yellow },
		}

		return treesitter_hls
	end
end

---parts of the editor that get loaded right away
M.main_highlights.editor = function()
	local editor_hls = {
		Normal = { fg = e.fg, bg = e.bg },
		NormalFloat = { fg = e.fg, bg = b.floating_windows },
		NormalContrast = { fg = e.fg, bg = e.bg_alt }, -- a help group for contrast fileypes
		ColorColumn = { fg = m.none, bg = e.active },
		Conceal = { fg = e.disabled },
		Cursor = { fg = e.bg_alt, bg = e.cursor },
		TermCursor = { link = "Cursor" }, -- cursor for the terminal
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode
		ErrorMsg = { fg = l.error },
		Folded = { fg = e.disabled, bg = e.bg_alt, italic = true },
		FoldColumn = { fg = m.blue },
		LineNr = { fg = e.line_numbers },
		CursorLineNr = { fg = e.accent },
		DiffAdd = { bg = functions.darken(g.added, 0.2, b.bg_blend) },
		DiffChange = { bg = functions.darken(g.modified, 0.2, b.bg_blend) },
		DiffDelete = { bg = functions.darken(g.removed, 0.2, b.bg_blend) },
		DiffText = { fg = g.modified, reverse = true },
		ModeMsg = { fg = e.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		NonText = { fg = e.disabled },
		SignColumn = { fg = e.fg },
		SpecialKey = { fg = m.purple },
		StatusLine = { fg = e.fg, bg = e.statusline or e.active },
		StatusLineNC = { fg = e.disabled, bg = e.statusline or e.bg },
		StatusLineTerm = { fg = e.fg, bg = e.statusline or e.active },
		StatusLineTermNC = { fg = e.disabled, bg = e.bg },
		TabLineFill = { fg = e.fg },
		TabLineSel = { fg = e.bg, bg = e.accent },
		TabLine = { fg = e.fg },
		Title = { fg = m.cyan, bold = true },
		WarningMsg = { fg = m.yellow },
		Whitespace = { fg = e.disabled },
		CursorLine = { bg = e.cursorline or e.active },
		CursorColumn = { link = "CursorLine" },
		Todo = { fg = m.yellow, bold = true },
		Ignore = { fg = e.disabled },
		Underlined = { fg = e.links, underline = true },
		Error = { fg = l.error, bold = true },

		-- color highlights
		Black = { fg = m.black },
		Red = { fg = m.red },
		Green = { fg = m.green },
		Yellow = { fg = m.yellow },
		Blue = { fg = m.blue },
		Cyan = { fg = m.cyan },
		Purple = { fg = m.purple },
		Orange = { fg = m.orange },
	}

	return editor_hls
end

---parts of the editor that get loaded asynchronously
M.async_highlights.editor = function()
	local editor_hls = {
		NormalNC = { bg = b.non_current_windows },
		FloatBorder = { fg = e.border, bg = b.floating_windows },
		SpellBad = { fg = m.red, italic = true, undercurl = true },
		SpellCap = { fg = m.blue, italic = true, undercurl = true },
		SpellLocal = { fg = m.cyan, italic = true, undercurl = true },
		SpellRare = { fg = m.purple, italic = true, undercurl = true },
		Warnings = { fg = m.yellow },
		healthError = { fg = l.error },
		healthSuccess = { fg = m.green },
		healthWarning = { fg = m.yellow },
		Visual = { fg = m.none, bg = e.selection },
		VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		Directory = { fg = m.blue },
		MatchParen = { fg = m.yellow, bold = true },
		Question = { fg = m.yellow }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { fg = e.highlight, bg = e.title, reverse = true },
		-- Search        = { fg = e.title, bg = e.selection, bold = true },
		-- IncSearch     = { fg = e.title, bg = e.selection, underline = true },
		Search = { fg = e.bg, bg = e.title },
		IncSearch = { fg = e.bg, bg = e.title, bold = true },
		CurSearch = { fg = e.bg, bg = m.yellow, bold = true },
		MoreMsg = { fg = e.accent },
		Pmenu = { fg = e.fg, bg = e.border }, -- popup menu
		PmenuSel = { fg = e.contrast, bg = e.accent }, -- Popup menu: selected item.
		PmenuSbar = { bg = e.active },
		PmenuThumb = { fg = e.fg },
		WildMenu = { fg = m.orange, bold = true }, -- current match in 'wildmenu' completion
		VertSplit = { fg = e.vsplit },
		WinSeparator = { fg = e.vsplit },
		diffAdded = { fg = g.added },
		diffRemoved = { fg = g.removed },
		-- ToolbarLine   = { fg = e.fg, bg = e.bg_alt },
		-- ToolbarButton = { fg = e.fg, bold = true },
		-- NormalMode       = { fg = e.disabled }, -- Normal mode message in the cmdline
		-- InsertMode       = { link = "NormalMode" },
		-- ReplacelMode     = { link = "NormalMode" },
		-- VisualMode       = { link = "NormalMode" },
		-- CommandMode      = { link = "NormalMode" },
	}

	if settings.disable.eob_lines then
		editor_hls.EndOfBuffer = { fg = e.bg }
	else
		editor_hls.EndOfBuffer = { fg = e.disabled }
	end

	return editor_hls
end

-- these should be loaded right away because
-- some plugins like lualine.nvim inherit the colors
M.main_highlights.load_lsp = function()
	local lsp_hls = {
		DiagnosticError = { fg = l.error },
		DiagnosticWarn = { fg = l.warning },
		DiagnosticInfo = { fg = l.info },
		DiagnosticHint = { fg = l.hint },
	}

	return lsp_hls
end

M.async_highlights.load_lsp = function()
	local lsp_hls = {
		-- Nvim 0.6. and up

		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticUnderlineError = { undercurl = true, sp = l.error },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticUnderlineWarn = { undercurl = true, sp = l.warning },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticUnderlineInfo = { undercurl = true, sp = l.info },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticUnderlineHint = { undercurl = true, sp = l.hint },
		LspReferenceText = { bg = e.selection }, -- used for highlighting "text" references
		LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references
		LspCodeLens = { italic = true, fg = l.hint, sp = l.hint },
		LspInlayHint = { italic = true, fg = s.comments },
		LspInfoBorder = { fg = e.border },

		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@punctuation" },
		["@lsp.type.interface"] = { link = "Identifier" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.typeAlias"] = { link = "@type" },
		["@lsp.type.unresolvedReference"] = { link = "@error" },
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
	}

	if settings.contrast.lsp_virtual_text then
		lsp_hls.DiagnosticVirtualTextError = { fg = l.error, bg = functions.darken(l.error, 0.1, b.bg_blend) }
		lsp_hls.DiagnosticVirtualTextWarn = { fg = l.warning, bg = functions.darken(l.warning, 0.1, b.bg_blend) }
		lsp_hls.DiagnosticVirtualTextInfo = { fg = l.info, bg = functions.darken(l.info, 0.1, b.bg_blend) }
		lsp_hls.DiagnosticVirtualTextHint = { fg = l.hint, bg = functions.darken(l.hint, 0.1, b.bg_blend) }
	else
		lsp_hls.DiagnosticVirtualTextError = { link = "DiagnosticError" }
		lsp_hls.DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" }
		lsp_hls.DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" }
		lsp_hls.DiagnosticVirtualTextHint = { link = "DiagnosticHint" }
	end

	return lsp_hls
end

---function for setting the terminal colors
M.load_terminal = function()
	vim.g.terminal_color_0 = m.black
	vim.g.terminal_color_1 = m.darkred
	vim.g.terminal_color_2 = m.darkgreen
	vim.g.terminal_color_3 = m.darkyellow
	vim.g.terminal_color_4 = m.darkblue
	vim.g.terminal_color_5 = m.darkpurple
	vim.g.terminal_color_6 = m.darkcyan
	vim.g.terminal_color_7 = m.white
	vim.g.terminal_color_8 = e.disabled
	vim.g.terminal_color_9 = m.red
	vim.g.terminal_color_10 = m.green
	vim.g.terminal_color_11 = m.yellow
	vim.g.terminal_color_12 = m.blue
	vim.g.terminal_color_13 = m.purple
	vim.g.terminal_color_14 = m.cyan
	vim.g.terminal_color_15 = m.white
end

-- apply plugin highlights
M.main_highlights = vim.tbl_extend("keep", M.main_highlights, plugins.main_highlights)
M.async_highlights = vim.tbl_extend("keep", M.async_highlights, plugins.async_highlights)

return M
