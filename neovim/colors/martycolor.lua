vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.g.colors_name = "martycolor"
vim.o.background = "dark"

local colors = {
	-- Base
	bg = "#282828",
	fg = "#e0e0e0",
	border = "#364153",

	-- UI variants
	bg_light = "#32302f",
	bg_lighter = "#3c3a39",
	fg_dim = "#9ca3af",
	fg_dark = "#6b7280",

	-- Core palette
	blue = "#6b9fd4", -- keywords, structure
	yellow = "#d4c484", -- functions, decorators
	green = "#7dba87", -- types, modules
	tan = "#d4a66a", -- strings
	gold = "#d4b445", -- numbers, booleans, constants
	lavender = "#b196d4", -- exit/meta
	sky = "#8ec7d4", -- variables, properties

	-- Diagnostics
	red = "#d47878",
	orange = "#d49a5c",
	cyan = "#5db8c4",
}

local set = vim.api.nvim_set_hl

-- ============================================================================
-- EDITOR UI
-- ============================================================================
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_light })
set(0, "FloatBorder", { fg = colors.border, bg = colors.bg_light })
set(0, "FloatTitle", { fg = colors.yellow, bg = colors.bg_light, bold = true })

-- Cursor & Lines
set(0, "Cursor", { fg = colors.bg, bg = colors.fg })
set(0, "CursorLine", { bg = colors.bg_light })
set(0, "CursorColumn", { bg = colors.bg_light })
set(0, "ColorColumn", { bg = colors.bg_light })
set(0, "LineNr", { fg = colors.fg_dark })
set(0, "CursorLineNr", { fg = colors.yellow, bold = true })
set(0, "SignColumn", { bg = colors.bg })

-- Selection & Search
set(0, "Visual", { bg = colors.bg_lighter })
set(0, "VisualNOS", { bg = colors.bg_lighter })
set(0, "Search", { fg = colors.bg, bg = colors.gold })
set(0, "IncSearch", { fg = colors.bg, bg = colors.blue })
set(0, "CurSearch", { fg = colors.bg, bg = colors.blue })
set(0, "Substitute", { fg = colors.bg, bg = colors.red })

-- Statusline & Tabline
set(0, "StatusLine", { fg = colors.fg, bg = colors.bg_light })
set(0, "StatusLineNC", { fg = colors.fg_dark, bg = colors.bg_light })
set(0, "TabLine", { fg = colors.fg_dark, bg = colors.bg_light })
set(0, "TabLineFill", { bg = colors.bg_light })
set(0, "TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })
set(0, "WinSeparator", { fg = colors.border })

-- Popup Menu (completion)
set(0, "Pmenu", { fg = colors.fg, bg = colors.bg_light })
set(0, "PmenuSel", { fg = colors.fg, bg = colors.bg_lighter })
set(0, "PmenuSbar", { bg = colors.bg_lighter })
set(0, "PmenuThumb", { bg = colors.fg_dark })

-- Misc UI
set(0, "Directory", { fg = colors.blue })
set(0, "Title", { fg = colors.yellow, bold = true })
set(0, "MatchParen", { fg = colors.gold, bold = true })
set(0, "NonText", { fg = colors.fg_dark })
set(0, "SpecialKey", { fg = colors.fg_dark })
set(0, "Folded", { fg = colors.fg_dark, bg = colors.bg_light })
set(0, "FoldColumn", { fg = colors.fg_dark, bg = colors.bg })

-- ============================================================================
-- SYNTAX (Traditional groups)
-- ============================================================================
set(0, "Comment", { fg = colors.fg_dark, italic = true })
set(0, "String", { fg = colors.tan })
set(0, "Character", { fg = colors.tan })
set(0, "Number", { fg = colors.gold })
set(0, "Boolean", { fg = colors.gold })
set(0, "Float", { fg = colors.gold })

set(0, "Identifier", { fg = colors.sky })
set(0, "Function", { fg = colors.yellow })

set(0, "Statement", { fg = colors.blue })
set(0, "Conditional", { fg = colors.blue })
set(0, "Repeat", { fg = colors.blue })
set(0, "Label", { fg = colors.blue })
set(0, "Operator", { fg = colors.fg_dim })
set(0, "Keyword", { fg = colors.blue })
set(0, "Exception", { fg = colors.blue })

set(0, "PreProc", { fg = colors.lavender })
set(0, "Include", { fg = colors.lavender })
set(0, "Define", { fg = colors.lavender })
set(0, "Macro", { fg = colors.lavender })
set(0, "PreCondit", { fg = colors.lavender })

set(0, "Type", { fg = colors.green })
set(0, "StorageClass", { fg = colors.blue })
set(0, "Structure", { fg = colors.green })
set(0, "Typedef", { fg = colors.green })

set(0, "Special", { fg = colors.lavender })
set(0, "SpecialChar", { fg = colors.gold })
set(0, "Tag", { fg = colors.blue })
set(0, "Delimiter", { fg = colors.fg_dim })
set(0, "SpecialComment", { fg = colors.fg_dark, italic = true })
set(0, "Debug", { fg = colors.red })

set(0, "Underlined", { underline = true })
set(0, "Error", { fg = colors.red })
set(0, "Todo", { fg = colors.gold, bold = true })
set(0, "Constant", { fg = colors.gold })

-- ============================================================================
-- TREESITTER
-- ============================================================================
-- Comments
set(0, "@comment", { link = "Comment" })
set(0, "@comment.documentation", { link = "Comment" })

-- Constants (literal values, grouped with numbers/booleans)
set(0, "@constant", { fg = colors.gold })
set(0, "@constant.builtin", { fg = colors.gold })
set(0, "@constant.macro", { fg = colors.lavender })

-- Strings
set(0, "@string", { link = "String" })
set(0, "@string.escape", { fg = colors.gold })
set(0, "@string.special", { fg = colors.gold })
set(0, "@string.regex", { fg = colors.gold })
set(0, "@character", { link = "Character" })
set(0, "@number", { link = "Number" })
set(0, "@boolean", { link = "Boolean" })
set(0, "@float", { link = "Float" })

-- Functions
set(0, "@function", { fg = colors.yellow })
set(0, "@function.builtin", { fg = colors.yellow })
set(0, "@function.call", { fg = colors.yellow })
set(0, "@function.macro", { fg = colors.lavender })
set(0, "@method", { fg = colors.yellow })
set(0, "@method.call", { fg = colors.yellow })
set(0, "@constructor", { fg = colors.yellow })
set(0, "@parameter", { fg = colors.sky })

-- Keywords
-- Structual are blue. Exit/meta are lavender.
set(0, "@keyword", { fg = colors.blue })
set(0, "@keyword.function", { fg = colors.blue })
set(0, "@keyword.operator", { fg = colors.blue })
set(0, "@keyword.return", { fg = colors.lavender })
set(0, "@keyword.import", { fg = colors.lavender })
set(0, "@keyword.export", { fg = colors.lavender })
set(0, "@keyword.conditional", { fg = colors.blue })
set(0, "@keyword.repeat", { fg = colors.blue })
set(0, "@keyword.exception", { fg = colors.blue })
set(0, "@keyword.coroutine", { fg = colors.blue })
set(0, "@keyword.type", { fg = colors.blue })
set(0, "@conditional", { fg = colors.blue })
set(0, "@repeat", { fg = colors.blue })
set(0, "@label", { fg = colors.blue })
set(0, "@operator", { fg = colors.fg_dim })
set(0, "@exception", { fg = colors.blue })

-- Types
set(0, "@type", { fg = colors.green })
set(0, "@type.builtin", { fg = colors.green })
set(0, "@type.definition", { fg = colors.green })
set(0, "@storageclass", { fg = colors.blue })
set(0, "@namespace", { fg = colors.green })
set(0, "@module", { fg = colors.green })
set(0, "@include", { fg = colors.lavender })
set(0, "@preproc", { fg = colors.lavender })

-- Variables
set(0, "@variable", { fg = colors.sky })
set(0, "@variable.builtin", { fg = colors.sky })
set(0, "@variable.parameter", { fg = colors.sky })
set(0, "@variable.member", { fg = colors.sky })
set(0, "@property", { fg = colors.sky })
set(0, "@field", { fg = colors.sky })

-- Decorators / Attributes (treated as function calls)
set(0, "@attribute", { fg = colors.yellow })
set(0, "@attribute.builtin", { fg = colors.yellow })

-- Punctuation
set(0, "@punctuation.delimiter", { fg = colors.fg_dim })
set(0, "@punctuation.bracket", { fg = colors.fg_dim })
set(0, "@punctuation.special", { fg = colors.fg_dim })

-- Tags (HTML/XML/JSX)
set(0, "@tag", { fg = colors.green })
set(0, "@tag.attribute", { fg = colors.sky })
set(0, "@tag.delimiter", { fg = colors.fg_dim })

-- Text (for markup languages)
set(0, "@text", { fg = colors.fg })
set(0, "@text.strong", { bold = true })
set(0, "@text.emphasis", { italic = true })
set(0, "@text.underline", { underline = true })
set(0, "@text.strike", { strikethrough = true })
set(0, "@text.title", { fg = colors.yellow, bold = true })
set(0, "@text.literal", { fg = colors.tan })
set(0, "@text.uri", { fg = colors.cyan, underline = true })
set(0, "@text.reference", { fg = colors.lavender })

-- ============================================================================
-- LSP SEMANTIC TOKENS
-- ============================================================================
set(0, "@lsp.type.class", { fg = colors.green })
set(0, "@lsp.type.decorator", { fg = colors.yellow })
set(0, "@lsp.type.enum", { fg = colors.green })
set(0, "@lsp.type.enumMember", { fg = colors.lavender })
set(0, "@lsp.type.function", { fg = colors.yellow })
set(0, "@lsp.type.interface", { fg = colors.green })
set(0, "@lsp.type.macro", { fg = colors.lavender })
set(0, "@lsp.type.method", { fg = colors.yellow })
set(0, "@lsp.type.namespace", { fg = colors.green })
set(0, "@lsp.type.parameter", { fg = colors.sky })
set(0, "@lsp.type.property", { fg = colors.sky })
set(0, "@lsp.type.struct", { fg = colors.green })
set(0, "@lsp.type.type", { fg = colors.green })
set(0, "@lsp.type.typeParameter", { fg = colors.green })
set(0, "@lsp.type.variable", { fg = colors.sky })

-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================
set(0, "DiagnosticError", { fg = colors.red })
set(0, "DiagnosticWarn", { fg = colors.orange })
set(0, "DiagnosticInfo", { fg = colors.cyan })
set(0, "DiagnosticHint", { fg = colors.fg_dark })

set(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.orange })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.cyan })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.fg_dark })

set(0, "DiagnosticVirtualTextError", { fg = colors.red })
set(0, "DiagnosticVirtualTextWarn", { fg = colors.orange })
set(0, "DiagnosticVirtualTextInfo", { fg = colors.cyan })
set(0, "DiagnosticVirtualTextHint", { fg = colors.fg_dark })

-- ============================================================================
-- GIT SIGNS
-- ============================================================================
set(0, "GitSignsAdd", { fg = colors.green })
set(0, "GitSignsChange", { fg = colors.blue })
set(0, "GitSignsDelete", { fg = colors.red })

-- ============================================================================
-- DIFF
-- ============================================================================
set(0, "DiffAdd", { bg = "#2a3a2a" })
set(0, "DiffChange", { bg = "#2a2a3a" })
set(0, "DiffDelete", { bg = "#3a2a2a" })
set(0, "DiffText", { bg = "#3a3a4a" })

-- ============================================================================
-- LANGUAGE SPECIFIC: Markdown
-- ============================================================================
set(0, "@markup.heading", { fg = colors.yellow, bold = true })
set(0, "@markup.heading.1", { fg = colors.yellow, bold = true })
set(0, "@markup.heading.2", { fg = colors.yellow, bold = true })
set(0, "@markup.heading.3", { fg = colors.yellow, bold = true })
set(0, "@markup.link", { fg = colors.lavender })
set(0, "@markup.link.url", { fg = colors.cyan, underline = true })
set(0, "@markup.raw", { fg = colors.tan })
set(0, "@markup.list", { fg = colors.fg_dim })

-- ============================================================================
-- LANGUAGE SPECIFIC: HTML/JSX
-- ============================================================================
set(0, "@tag.html", { fg = colors.blue })
set(0, "@tag.tsx", { fg = colors.blue })
set(0, "@tag.javascript", { fg = colors.blue })
