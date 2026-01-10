vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.g.colors_name = "martycolor"
vim.o.background = "dark"

local colors = {
	bg = "#282828",
	fg = "#e0e0e0",
	border = "#364153",

	light_blue = "#8ec5ff",
	blue = "#2b7fff",
	dark_blue = "#3F69D9",

	gray = "#99a1af",

	light_red = "#ffa2a2",
	red = "#c10007",
	dark_red = "#82181a",

	purple = "#bc42c2",
	dark_purple = "#8200db",

	light_green = "#C4FFC9",
	green = "#47D69A",

	light_brown = "#C28D70",

	light_yellow = "#ffde3b",
	yellow = "#daac00",

	orange = "#E89346",
}

local set = vim.api.nvim_set_hl

-- ============================================================================
-- EDITOR UI
-- ============================================================================
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
-- set(0, "NormalFloat", { fg = ..., bg = ... })
-- set(0, "FloatBorder", { fg = ..., bg = ... })
-- set(0, "FloatTitle", { fg = ..., bg = ..., bold = true })

-- Cursor & Lines
-- set(0, "Cursor", { fg = ..., bg = ... })
-- set(0, "CursorLine", { bg = ... })
-- set(0, "CursorColumn", { bg = ... })
-- set(0, "ColorColumn", { bg = ... })
set(0, "LineNr", { fg = colors.gray, bold = true })
-- set(0, "LineNrAbove", { fg = ... })
-- set(0, "LineNrBelow", { fg = ... })
set(0, "CursorLineNr", { fg = colors.light_blue, bold = true })

-- Selection & Search
-- set(0, "Visual", { bg = ... })
-- set(0, "VisualNOS", { bg = ... })
-- set(0, "Search", { fg = ..., bg = ... })
-- set(0, "IncSearch", { fg = ..., bg = ... })
-- set(0, "CurSearch", { fg = ..., bg = ... })

-- Statusline & Tabline
-- set(0, "StatusLine", { fg = ..., bg = ... })
-- set(0, "StatusLineNC", { fg = ..., bg = ... })
-- set(0, "TabLine", { fg = ..., bg = ... })
-- set(0, "TabLineFill", { bg = ... })
-- set(0, "TabLineSel", { fg = ..., bg = ..., bold = true })

-- Popup Menu (completion)
-- set(0, "Pmenu", { fg = ..., bg = ... })
-- set(0, "PmenuSel", { fg = ..., bg = ... })
-- set(0, "PmenuSbar", { bg = ... })
-- set(0, "PmenuThumb", { bg = ... })

-- ============================================================================
-- SYNTAX (Traditional groups)
-- ============================================================================
set(0, "Comment", { fg = colors.gray, italic = true })
set(0, "String", { fg = colors.light_brown })
-- set(0, "Character", { fg = ... })
set(0, "Number", { fg = colors.light_green })
set(0, "Boolean", { fg = colors.dark_blue })
-- set(0, "Float", { fg = ... })

set(0, "Identifier", { fg = colors.light_blue })
set(0, "Constant", { fg = colors.orange })
set(0, "Function", { fg = colors.light_yellow })
--
set(0, "Statement", { fg = colors.dark_blue })
-- set(0, "Conditional", { fg = ... })
-- set(0, "Repeat", { fg = ... })
-- set(0, "Label", { fg = ... })
-- set(0, "Operator", { fg = ... })
-- set(0, "Keyword", { fg = ... })
-- set(0, "Exception", { fg = ... })
--
-- set(0, "PreProc", { fg = ... })
set(0, "Include", { fg = colors.purple })
-- set(0, "Define", { fg = ... })
-- set(0, "Macro", { fg = ... })
-- set(0, "PreCondit", { fg = ... })
--
set(0, "Type", { fg = colors.green })
-- set(0, "StorageClass", { fg = ... })
-- set(0, "Structure", { fg = ... })
-- set(0, "Typedef", { fg = ... })
--
-- set(0, "Special", { fg = ... })
-- set(0, "SpecialChar", { fg = ... })
-- set(0, "Tag", { fg = ... })
set(0, "Delimiter", { fg = colors.yellow })
-- set(0, "SpecialComment", { fg = ... })
-- set(0, "Debug", { fg = ... })
--
-- set(0, "Underlined", { underline = true })
-- set(0, "Error", { fg = ... })
-- set(0, "Todo", { fg = ..., bold = true })

-- ============================================================================
-- TREESITTER (Link to traditional groups)
-- ============================================================================
-- Comments
-- set(0, "@comment", { link = "Comment" })
-- set(0, "@comment.documentation", { link = "Comment" })

-- Constants
set(0, "@constant", { link = "Constant" })
-- set(0, "@constant.builtin", { link = "Special" })
-- set(0, "@constant.macro", { link = "Define" })

-- Strings
-- set(0, "@string", { link = "String" })
-- set(0, "@string.escape", { link = "SpecialChar" })
-- set(0, "@string.special", { link = "SpecialChar" })
-- set(0, "@character", { link = "Character" })
set(0, "@number", { link = "Number" })
set(0, "@boolean", { link = "Boolean" })
-- set(0, "@float", { link = "Float" })

-- Functions
-- set(0, "@function", { link = "Function" })
-- set(0, "@function.builtin", { link = "Special" })
-- set(0, "@function.call", { link = "Function" })
-- set(0, "@function.macro", { link = "Macro" })
-- set(0, "@method", { link = "Function" })
-- set(0, "@method.call", { link = "Function" })
-- set(0, "@constructor", { link = "Special" })
set(0, "@parameter", { link = "Identifier" })

-- Keywords
-- set(0, "@keyword", { link = "Keyword" })
-- set(0, "@keyword.function", { link = "Keyword" })
-- set(0, "@keyword.operator", { link = "Operator" })
-- set(0, "@keyword.return", { link = "Keyword" })
-- set(0, "@conditional", { link = "Conditional" })
-- set(0, "@repeat", { link = "Repeat" })
-- set(0, "@label", { link = "Label" })
-- set(0, "@operator", { link = "Operator" })
-- set(0, "@exception", { link = "Exception" })

-- Types
-- set(0, "@type", { link = "Type" })
-- set(0, "@type.builtin", { link = "Type" })
-- set(0, "@type.definition", { link = "Typedef" })
-- set(0, "@storageclass", { link = "StorageClass" })
set(0, "@namespace", { link = "Identifier" })
set(0, "@include", { link = "Include" })
set(0, "@keyword.import", { link = "Include" })
-- set(0, "@preproc", { link = "PreProc" })

-- Variables
set(0, "@variable", { link = "Identifier" })
-- set(0, "@variable.builtin", { link = "Special" })
set(0, "@property", { link = "Identifier" })
set(0, "@field", { link = "Identifier" })

-- Text (for markup languages)
-- set(0, "@text", { link = "Normal" })
-- set(0, "@text.strong", { bold = true })
-- set(0, "@text.emphasis", { italic = true })
-- set(0, "@text.underline", { underline = true })
-- set(0, "@text.title", { link = "Title" })
-- set(0, "@text.literal", { link = "String" })
-- set(0, "@text.uri", { link = "Underlined" })

-- Punctuation
-- set(0, "@punctuation.delimiter", { link = "Delimiter" })
-- set(0, "@punctuation.bracket", { link = "Delimiter" })
-- set(0, "@punctuation.special", { link = "Delimiter" })

-- Tags (HTML/XML/JSX)
-- set(0, "@tag", { link = "Tag" })
set(0, "@tag.attribute", { link = "Identifier" })
-- set(0, "@tag.delimiter", { link = "Delimiter" })

set(0, "@attribute", { link = "Function" })

-- ============================================================================
-- LSP / DIAGNOSTICS
-- ============================================================================
-- set(0, "DiagnosticError", { fg = ... })
-- set(0, "DiagnosticWarn", { fg = ... })
-- set(0, "DiagnosticInfo", { fg = ... })
-- set(0, "DiagnosticHint", { fg = ... })
--
-- set(0, "DiagnosticUnderlineError", { undercurl = true, sp = ... })
-- set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = ... })
-- set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = ... })
-- set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = ... })

-- ============================================================================
-- GIT SIGNS (if using gitsigns.nvim)
-- ============================================================================
-- set(0, "GitSignsAdd", { fg = ... })
-- set(0, "GitSignsChange", { fg = ... })
-- set(0, "GitSignsDelete", { fg = ... })

-- ============================================================================
-- DIFF
-- ============================================================================
-- set(0, "DiffAdd", { fg = ..., bg = ... })
-- set(0, "DiffChange", { fg = ..., bg = ... })
-- set(0, "DiffDelete", { fg = ..., bg = ... })
-- set(0, "DiffText", { fg = ..., bg = ... })
