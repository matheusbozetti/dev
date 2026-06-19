require("vim._core.ui2").enable({})

require("options")
require("keymaps")
require("commands")
require("pack")
require("format")

vim.cmd.colorscheme("kanagawa-dragon")

local transparent_groups = {
	-- base
	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"FloatTitle",
	"SignColumn",
	"EndOfBuffer",

	-- telescope/snacks/mini
	"Pmenu",
	"PmenuSel",
	"PmenuSbar",
	"PmenuThumb",

	-- snacks
	"SnacksPicker",
	"SnacksPickerBorder",
	"SnacksPickerTitle",
	"SnacksPickerInput",
	"SnacksPickerInputBorder",
	"SnacksPickerPreview",
	"SnacksPickerPreviewBorder",

	-- mini.nvim
	"MiniPickNormal",
	"MiniPickBorder",
	"MiniPickPrompt",
	"MiniPickMatchCurrent",
	"MiniFilesNormal",
	"MiniFilesBorder",
	"MiniFilesTitle",
	"MiniFilesTitleFocused",
}

for _, group in ipairs(transparent_groups) do
	vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end
