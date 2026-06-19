-- tmux-mocha — Catppuccin Mocha base + accent cyan
-- Derivado das cores do tmux: bg/fg de @bg/@fg (#1e1e2e / #cdd6f4),
-- accent cyan (colour6 do tmux-power) e mauve (borda magenta do pane ativo).

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "tmux-mocha"

local p = {
	-- bases / neutros
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
	surface0 = "#313244",
	surface1 = "#45475a",
	surface2 = "#585b70",
	overlay0 = "#6c7086",
	overlay1 = "#7f849c",
	overlay2 = "#9399b2",
	subtext0 = "#a6adc8",
	subtext1 = "#bac2de",
	text = "#cdd6f4",
	-- accents
	sky = "#89dceb", -- accent primário (cyan)
	teal = "#94e2d5",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	mauve = "#cba6f7",
	pink = "#f5c2e7",
	maroon = "#eba0ac",
	red = "#f38ba8",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
}

local function set(groups)
	for group, opts in pairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

set({
	---------------------------------------------------------------------------
	-- UI base
	---------------------------------------------------------------------------
	Normal = { fg = p.text, bg = p.base },
	NormalNC = { fg = p.text, bg = p.base },
	NormalFloat = { fg = p.text, bg = p.mantle },
	FloatBorder = { fg = p.sapphire, bg = p.mantle },
	FloatTitle = { fg = p.sky, bg = p.mantle, bold = true },
	Cursor = { fg = p.base, bg = p.text },
	lCursor = { fg = p.base, bg = p.text },
	CursorLine = { bg = p.surface0 },
	CursorColumn = { bg = p.surface0 },
	CursorLineNr = { fg = p.sky, bold = true },
	LineNr = { fg = p.surface2 },
	SignColumn = { bg = p.base },
	ColorColumn = { bg = p.mantle },
	Visual = { bg = p.surface1 },
	VisualNOS = { bg = p.surface1 },
	Search = { fg = p.base, bg = p.yellow },
	IncSearch = { fg = p.base, bg = p.peach },
	CurSearch = { fg = p.base, bg = p.peach, bold = true },
	MatchParen = { fg = p.sky, bold = true },
	Pmenu = { fg = p.text, bg = p.mantle },
	PmenuSel = { fg = p.base, bg = p.sky, bold = true },
	PmenuSbar = { bg = p.surface0 },
	PmenuThumb = { bg = p.surface2 },
	WinSeparator = { fg = p.surface1 },
	VertSplit = { fg = p.surface1 },
	EndOfBuffer = { fg = p.base },
	Folded = { fg = p.subtext0, bg = p.surface0 },
	FoldColumn = { fg = p.overlay0, bg = p.base },
	NonText = { fg = p.surface1 },
	Whitespace = { fg = p.surface1 },
	SpecialKey = { fg = p.surface2 },
	Directory = { fg = p.sky },
	Conceal = { fg = p.overlay1 },
	Title = { fg = p.sky, bold = true },
	ErrorMsg = { fg = p.red, bold = true },
	WarningMsg = { fg = p.yellow },
	ModeMsg = { fg = p.subtext1, bold = true },
	MoreMsg = { fg = p.sky },
	Question = { fg = p.sky },
	QuickFixLine = { bg = p.surface0, bold = true },
	StatusLine = { fg = p.text, bg = p.mantle },
	StatusLineNC = { fg = p.overlay0, bg = p.mantle },
	TabLine = { fg = p.overlay1, bg = p.mantle },
	TabLineFill = { bg = p.mantle },
	TabLineSel = { fg = p.base, bg = p.sky, bold = true },
	WildMenu = { bg = p.surface1 },
	WinBar = { fg = p.text, bg = p.base },
	WinBarNC = { fg = p.overlay0, bg = p.base },
	LineNrAbove = { fg = p.surface2 },
	LineNrBelow = { fg = p.surface2 },

	---------------------------------------------------------------------------
	-- Sintaxe clássica (regex) — usada pelas linguagens web (js/ts/vue/css/html)
	---------------------------------------------------------------------------
	Comment = { fg = p.overlay0, italic = true },
	Identifier = { fg = p.text },
	Function = { fg = p.sky },
	Statement = { fg = p.mauve },
	Keyword = { fg = p.mauve },
	Conditional = { fg = p.mauve },
	Repeat = { fg = p.mauve },
	Label = { fg = p.mauve },
	Exception = { fg = p.mauve },
	Operator = { fg = p.overlay2 },
	String = { fg = p.green },
	Character = { fg = p.green },
	Number = { fg = p.peach },
	Float = { fg = p.peach },
	Boolean = { fg = p.peach },
	Constant = { fg = p.peach },
	Type = { fg = p.teal },
	StorageClass = { fg = p.yellow },
	Structure = { fg = p.teal },
	Typedef = { fg = p.teal },
	PreProc = { fg = p.pink },
	Include = { fg = p.pink },
	Define = { fg = p.pink },
	Macro = { fg = p.pink },
	PreCondit = { fg = p.pink },
	Special = { fg = p.blue },
	SpecialChar = { fg = p.pink },
	SpecialComment = { fg = p.sky, italic = true },
	Tag = { fg = p.mauve },
	Delimiter = { fg = p.overlay2 },
	Debug = { fg = p.red },
	Todo = { fg = p.base, bg = p.yellow, bold = true },
	Error = { fg = p.red },
	Underlined = { fg = p.sapphire, underline = true },

	---------------------------------------------------------------------------
	-- Treesitter (@*) — go/rust/lua/bash/yaml/json/toml/odin/markdown
	---------------------------------------------------------------------------
	["@variable"] = { fg = p.text },
	["@variable.builtin"] = { fg = p.red, italic = true },
	["@variable.parameter"] = { fg = p.maroon },
	["@variable.member"] = { fg = p.blue },
	["@property"] = { fg = p.blue },
	["@field"] = { fg = p.blue },
	["@function"] = { fg = p.sky },
	["@function.call"] = { fg = p.sky },
	["@function.method"] = { fg = p.sky },
	["@function.method.call"] = { fg = p.sky },
	["@function.builtin"] = { fg = p.sky, italic = true },
	["@function.macro"] = { fg = p.pink },
	["@constructor"] = { fg = p.yellow },
	["@keyword"] = { fg = p.mauve },
	["@keyword.function"] = { fg = p.mauve },
	["@keyword.operator"] = { fg = p.mauve },
	["@keyword.return"] = { fg = p.mauve, italic = true },
	["@keyword.import"] = { fg = p.mauve },
	["@keyword.conditional"] = { fg = p.mauve },
	["@keyword.repeat"] = { fg = p.mauve },
	["@keyword.exception"] = { fg = p.mauve },
	["@operator"] = { fg = p.overlay2 },
	["@string"] = { fg = p.green },
	["@string.escape"] = { fg = p.pink },
	["@string.regexp"] = { fg = p.peach },
	["@string.special"] = { fg = p.blue },
	["@character"] = { fg = p.green },
	["@character.special"] = { fg = p.pink },
	["@number"] = { fg = p.peach },
	["@number.float"] = { fg = p.peach },
	["@boolean"] = { fg = p.peach },
	["@constant"] = { fg = p.peach },
	["@constant.builtin"] = { fg = p.peach },
	["@constant.macro"] = { fg = p.pink },
	["@type"] = { fg = p.teal },
	["@type.builtin"] = { fg = p.teal, italic = true },
	["@type.definition"] = { fg = p.teal },
	["@attribute"] = { fg = p.yellow },
	["@attribute.builtin"] = { fg = p.yellow },
	["@module"] = { fg = p.teal, italic = true },
	["@namespace"] = { fg = p.teal, italic = true },
	["@label"] = { fg = p.sapphire },
	["@punctuation.delimiter"] = { fg = p.overlay2 },
	["@punctuation.bracket"] = { fg = p.overlay2 },
	["@punctuation.special"] = { fg = p.sky },
	["@comment"] = { fg = p.overlay0, italic = true },
	["@comment.error"] = { fg = p.base, bg = p.red, bold = true },
	["@comment.warning"] = { fg = p.base, bg = p.yellow, bold = true },
	["@comment.todo"] = { fg = p.base, bg = p.sky, bold = true },
	["@comment.note"] = { fg = p.base, bg = p.teal, bold = true },
	["@tag"] = { fg = p.mauve },
	["@tag.builtin"] = { fg = p.mauve },
	["@tag.attribute"] = { fg = p.teal },
	["@tag.delimiter"] = { fg = p.overlay2 },
	-- markdown / markup
	["@markup.heading"] = { fg = p.sky, bold = true },
	["@markup.heading.1"] = { fg = p.sky, bold = true },
	["@markup.heading.2"] = { fg = p.mauve, bold = true },
	["@markup.heading.3"] = { fg = p.green, bold = true },
	["@markup.heading.4"] = { fg = p.yellow, bold = true },
	["@markup.heading.5"] = { fg = p.peach, bold = true },
	["@markup.heading.6"] = { fg = p.teal, bold = true },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.underline"] = { underline = true },
	["@markup.raw"] = { fg = p.green },
	["@markup.raw.block"] = { fg = p.green },
	["@markup.link"] = { fg = p.sapphire, underline = true },
	["@markup.link.label"] = { fg = p.sky },
	["@markup.link.url"] = { fg = p.sapphire, underline = true },
	["@markup.list"] = { fg = p.peach },
	["@markup.list.checked"] = { fg = p.green },
	["@markup.list.unchecked"] = { fg = p.overlay1 },
	["@markup.quote"] = { fg = p.subtext0, italic = true },
	["@diff.plus"] = { fg = p.green },
	["@diff.minus"] = { fg = p.red },
	["@diff.delta"] = { fg = p.blue },

	---------------------------------------------------------------------------
	-- Semantic tokens LSP (@lsp.type.*) — usados nas linguagens web
	---------------------------------------------------------------------------
	["@lsp.type.class"] = { fg = p.teal },
	["@lsp.type.interface"] = { fg = p.teal },
	["@lsp.type.enum"] = { fg = p.teal },
	["@lsp.type.struct"] = { fg = p.teal },
	["@lsp.type.type"] = { fg = p.teal },
	["@lsp.type.typeParameter"] = { fg = p.teal, italic = true },
	["@lsp.type.namespace"] = { fg = p.teal, italic = true },
	["@lsp.type.function"] = { fg = p.sky },
	["@lsp.type.method"] = { fg = p.sky },
	["@lsp.type.parameter"] = { fg = p.maroon },
	["@lsp.type.property"] = { fg = p.blue },
	["@lsp.type.variable"] = { fg = p.text },
	["@lsp.type.enumMember"] = { fg = p.peach },
	["@lsp.type.decorator"] = { fg = p.yellow },
	["@lsp.type.keyword"] = { fg = p.mauve },
	["@lsp.type.string"] = { fg = p.green },
	["@lsp.type.number"] = { fg = p.peach },
	["@lsp.type.comment"] = { fg = p.overlay0, italic = true },
	["@lsp.typemod.variable.readonly"] = { fg = p.peach },
	["@lsp.typemod.variable.defaultLibrary"] = { fg = p.red, italic = true },
	["@lsp.typemod.function.defaultLibrary"] = { fg = p.sky, italic = true },
	["@lsp.typemod.property.readonly"] = { fg = p.blue },
	["@lsp.mod.deprecated"] = { strikethrough = true },

	---------------------------------------------------------------------------
	-- Diagnostics (undercurl suportado pelo tmux.conf)
	---------------------------------------------------------------------------
	DiagnosticError = { fg = p.red },
	DiagnosticWarn = { fg = p.yellow },
	DiagnosticInfo = { fg = p.sky },
	DiagnosticHint = { fg = p.teal },
	DiagnosticOk = { fg = p.green },
	DiagnosticVirtualTextError = { fg = p.red, bg = p.mantle },
	DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.mantle },
	DiagnosticVirtualTextInfo = { fg = p.sky, bg = p.mantle },
	DiagnosticVirtualTextHint = { fg = p.teal, bg = p.mantle },
	DiagnosticVirtualTextOk = { fg = p.green, bg = p.mantle },
	DiagnosticUnderlineError = { undercurl = true, sp = p.red },
	DiagnosticUnderlineWarn = { undercurl = true, sp = p.yellow },
	DiagnosticUnderlineInfo = { undercurl = true, sp = p.sky },
	DiagnosticUnderlineHint = { undercurl = true, sp = p.teal },
	DiagnosticUnderlineOk = { undercurl = true, sp = p.green },
	DiagnosticUnnecessary = { fg = p.overlay1 },
	DiagnosticDeprecated = { strikethrough = true, sp = p.overlay1 },
	DiagnosticFloatingError = { fg = p.red, bg = p.mantle },
	DiagnosticFloatingWarn = { fg = p.yellow, bg = p.mantle },
	DiagnosticFloatingInfo = { fg = p.sky, bg = p.mantle },
	DiagnosticFloatingHint = { fg = p.teal, bg = p.mantle },

	---------------------------------------------------------------------------
	-- LSP referências / extras
	---------------------------------------------------------------------------
	LspReferenceText = { bg = p.surface1 },
	LspReferenceRead = { bg = p.surface1 },
	LspReferenceWrite = { bg = p.surface1, underline = true },
	LspInlayHint = { fg = p.overlay1, bg = p.mantle, italic = true },
	LspSignatureActiveParameter = { fg = p.sky, bold = true },
	LspCodeLens = { fg = p.overlay0, italic = true },

	---------------------------------------------------------------------------
	-- Diff / git (mini.diff usa sinais)
	---------------------------------------------------------------------------
	DiffAdd = { fg = p.green, bg = p.mantle },
	DiffChange = { fg = p.blue, bg = p.mantle },
	DiffDelete = { fg = p.red, bg = p.mantle },
	DiffText = { fg = p.base, bg = p.blue },
	Added = { fg = p.green },
	Changed = { fg = p.blue },
	Removed = { fg = p.red },
	MiniDiffSignAdd = { fg = p.green },
	MiniDiffSignChange = { fg = p.blue },
	MiniDiffSignDelete = { fg = p.red },
	MiniDiffOverAdd = { fg = p.green, bg = p.surface0 },
	MiniDiffOverChange = { fg = p.blue, bg = p.surface0 },
	MiniDiffOverChangeBuf = { fg = p.blue, bg = p.surface1 },
	MiniDiffOverContext = { bg = p.surface0 },
	MiniDiffOverDelete = { fg = p.red, bg = p.surface0 },

	---------------------------------------------------------------------------
	-- mini.statusline
	---------------------------------------------------------------------------
	MiniStatuslineModeNormal = { fg = p.base, bg = p.sky, bold = true },
	MiniStatuslineModeInsert = { fg = p.base, bg = p.green, bold = true },
	MiniStatuslineModeVisual = { fg = p.base, bg = p.mauve, bold = true },
	MiniStatuslineModeReplace = { fg = p.base, bg = p.red, bold = true },
	MiniStatuslineModeCommand = { fg = p.base, bg = p.peach, bold = true },
	MiniStatuslineModeOther = { fg = p.base, bg = p.teal, bold = true },
	MiniStatuslineDevinfo = { fg = p.subtext1, bg = p.surface0 },
	MiniStatuslineFilename = { fg = p.text, bg = p.surface1 },
	MiniStatuslineFileinfo = { fg = p.subtext1, bg = p.surface0 },
	MiniStatuslineInactive = { fg = p.overlay0, bg = p.mantle },

	---------------------------------------------------------------------------
	-- mini.tabline
	---------------------------------------------------------------------------
	MiniTablineCurrent = { fg = p.base, bg = p.sky, bold = true },
	MiniTablineVisible = { fg = p.text, bg = p.surface0 },
	MiniTablineHidden = { fg = p.overlay1, bg = p.mantle },
	MiniTablineModifiedCurrent = { fg = p.base, bg = p.peach, bold = true },
	MiniTablineModifiedVisible = { fg = p.peach, bg = p.surface0 },
	MiniTablineModifiedHidden = { fg = p.peach, bg = p.mantle },
	MiniTablineTabpagesection = { fg = p.base, bg = p.mauve, bold = true },
	MiniTablineFill = { bg = p.mantle },

	---------------------------------------------------------------------------
	-- mini.files / mini.clue
	---------------------------------------------------------------------------
	MiniFilesNormal = { fg = p.text, bg = p.mantle },
	MiniFilesBorder = { fg = p.sapphire, bg = p.mantle },
	MiniFilesBorderModified = { fg = p.peach, bg = p.mantle },
	MiniFilesTitle = { fg = p.subtext0, bg = p.mantle },
	MiniFilesTitleFocused = { fg = p.sky, bg = p.mantle, bold = true },
	MiniFilesCursorLine = { bg = p.surface0 },
	MiniFilesDirectory = { fg = p.sky },
	MiniFilesFile = { fg = p.text },
	MiniClueTitle = { fg = p.sky, bg = p.mantle, bold = true },
	MiniClueDescGroup = { fg = p.peach, bg = p.mantle },
	MiniClueDescSingle = { fg = p.text, bg = p.mantle },
	MiniClueNextKey = { fg = p.sky, bg = p.mantle, bold = true },
	MiniClueNextKeyWithPostkeys = { fg = p.peach, bg = p.mantle, bold = true },
	MiniClueSeparator = { fg = p.overlay0, bg = p.mantle },
	MiniClueBorder = { fg = p.sapphire, bg = p.mantle },

	-- mini.icons / mini.cursorword / mini.indentscope
	MiniIconsAzure = { fg = p.sky },
	MiniIconsBlue = { fg = p.blue },
	MiniIconsCyan = { fg = p.teal },
	MiniIconsGreen = { fg = p.green },
	MiniIconsGrey = { fg = p.subtext0 },
	MiniIconsOrange = { fg = p.peach },
	MiniIconsPurple = { fg = p.mauve },
	MiniIconsRed = { fg = p.red },
	MiniIconsYellow = { fg = p.yellow },
	MiniCursorword = { underline = true },
	MiniCursorwordCurrent = { underline = true },

	---------------------------------------------------------------------------
	-- snacks.nvim
	---------------------------------------------------------------------------
	SnacksPicker = { fg = p.text, bg = p.mantle },
	SnacksPickerBorder = { fg = p.sapphire, bg = p.mantle },
	SnacksPickerTitle = { fg = p.sky, bg = p.mantle, bold = true },
	SnacksPickerInput = { fg = p.text, bg = p.mantle },
	SnacksPickerInputBorder = { fg = p.sapphire, bg = p.mantle },
	SnacksPickerInputSearch = { fg = p.peach },
	SnacksPickerList = { fg = p.text, bg = p.mantle },
	SnacksPickerListCursorLine = { bg = p.surface0 },
	SnacksPickerPreview = { fg = p.text, bg = p.mantle },
	SnacksPickerPreviewBorder = { fg = p.sapphire, bg = p.mantle },
	SnacksPickerPreviewTitle = { fg = p.sky, bg = p.mantle, bold = true },
	SnacksPickerMatch = { fg = p.sky, bold = true },
	SnacksPickerDir = { fg = p.overlay1 },
	SnacksPickerFile = { fg = p.text },
	SnacksPickerSelected = { fg = p.peach },
	SnacksIndent = { fg = p.surface0 },
	SnacksIndentScope = { fg = p.surface2 },
	SnacksDashboardHeader = { fg = p.sky },
	SnacksDashboardTitle = { fg = p.sky, bold = true },
	SnacksDashboardDesc = { fg = p.text },
	SnacksDashboardKey = { fg = p.peach },
	SnacksDashboardIcon = { fg = p.teal },
	SnacksDashboardFooter = { fg = p.overlay1 },
	SnacksDashboardSpecial = { fg = p.mauve },
	SnacksNotifierInfo = { fg = p.sky, bg = p.mantle },
	SnacksNotifierWarn = { fg = p.yellow, bg = p.mantle },
	SnacksNotifierError = { fg = p.red, bg = p.mantle },
	SnacksNotifierDebug = { fg = p.overlay1, bg = p.mantle },
	SnacksNotifierTrace = { fg = p.mauve, bg = p.mantle },
	SnacksNotifierBorderInfo = { fg = p.sky, bg = p.mantle },
	SnacksNotifierBorderWarn = { fg = p.yellow, bg = p.mantle },
	SnacksNotifierBorderError = { fg = p.red, bg = p.mantle },
	SnacksNotifierIconInfo = { fg = p.sky },
	SnacksNotifierIconWarn = { fg = p.yellow },
	SnacksNotifierIconError = { fg = p.red },
	SnacksWordsUnderCursor = { bg = p.surface1 },

	---------------------------------------------------------------------------
	-- blink.cmp (menu com borda rounded)
	---------------------------------------------------------------------------
	BlinkCmpMenu = { fg = p.text, bg = p.mantle },
	BlinkCmpMenuBorder = { fg = p.sapphire, bg = p.mantle },
	BlinkCmpMenuSelection = { bg = p.surface1, bold = true },
	BlinkCmpScrollBarThumb = { bg = p.surface2 },
	BlinkCmpScrollBarGutter = { bg = p.surface0 },
	BlinkCmpLabel = { fg = p.text },
	BlinkCmpLabelDeprecated = { fg = p.overlay1, strikethrough = true },
	BlinkCmpLabelMatch = { fg = p.sky, bold = true },
	BlinkCmpLabelDetail = { fg = p.overlay1 },
	BlinkCmpLabelDescription = { fg = p.overlay1 },
	BlinkCmpKind = { fg = p.sky },
	BlinkCmpKindText = { fg = p.text },
	BlinkCmpKindMethod = { fg = p.sky },
	BlinkCmpKindFunction = { fg = p.sky },
	BlinkCmpKindConstructor = { fg = p.yellow },
	BlinkCmpKindField = { fg = p.blue },
	BlinkCmpKindVariable = { fg = p.text },
	BlinkCmpKindClass = { fg = p.teal },
	BlinkCmpKindInterface = { fg = p.teal },
	BlinkCmpKindModule = { fg = p.teal },
	BlinkCmpKindProperty = { fg = p.blue },
	BlinkCmpKindUnit = { fg = p.peach },
	BlinkCmpKindValue = { fg = p.peach },
	BlinkCmpKindEnum = { fg = p.teal },
	BlinkCmpKindKeyword = { fg = p.mauve },
	BlinkCmpKindSnippet = { fg = p.green },
	BlinkCmpKindColor = { fg = p.pink },
	BlinkCmpKindFile = { fg = p.sky },
	BlinkCmpKindReference = { fg = p.sapphire },
	BlinkCmpKindFolder = { fg = p.sky },
	BlinkCmpKindEnumMember = { fg = p.peach },
	BlinkCmpKindConstant = { fg = p.peach },
	BlinkCmpKindStruct = { fg = p.teal },
	BlinkCmpKindEvent = { fg = p.yellow },
	BlinkCmpKindOperator = { fg = p.overlay2 },
	BlinkCmpKindTypeParameter = { fg = p.teal },
	BlinkCmpDoc = { fg = p.text, bg = p.mantle },
	BlinkCmpDocBorder = { fg = p.sapphire, bg = p.mantle },
	BlinkCmpDocSeparator = { fg = p.surface1, bg = p.mantle },
	BlinkCmpGhostText = { fg = p.overlay0, italic = true },

	---------------------------------------------------------------------------
	-- Spell
	---------------------------------------------------------------------------
	SpellBad = { undercurl = true, sp = p.red },
	SpellCap = { undercurl = true, sp = p.yellow },
	SpellLocal = { undercurl = true, sp = p.sky },
	SpellRare = { undercurl = true, sp = p.teal },
})

-- Terminal colors (consistentes com a paleta tmux/Catppuccin Mocha)
vim.g.terminal_color_0 = p.surface1
vim.g.terminal_color_1 = p.red
vim.g.terminal_color_2 = p.green
vim.g.terminal_color_3 = p.yellow
vim.g.terminal_color_4 = p.blue
vim.g.terminal_color_5 = p.mauve
vim.g.terminal_color_6 = p.sky
vim.g.terminal_color_7 = p.subtext1
vim.g.terminal_color_8 = p.surface2
vim.g.terminal_color_9 = p.red
vim.g.terminal_color_10 = p.green
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = p.blue
vim.g.terminal_color_13 = p.mauve
vim.g.terminal_color_14 = p.sky
vim.g.terminal_color_15 = p.subtext0
