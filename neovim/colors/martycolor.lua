vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.g.colors_name = "martycolor"
vim.o.background = "dark"

local colors = {
	bg = "#101828",
	fg = "#f9fafb",
	fg_muted = "#d1d5dc",
	border = "#364153",
	primary = "#2b7fff",
	primaryMuted = "#8ec5ff",
	green = "#70e000",
}

-- ============================================================================
-- EDITOR UI
-- ============================================================================
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_float })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.border, bg = colors.bg_float })
-- vim.api.nvim_set_hl(0, "FloatTitle", { fg = colors.primary, bg = colors.bg_float, bold = true })

-- Cursor & Lines
-- vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.fg })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.bg_highlight })
-- vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.bg_highlight })
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.bg_highlight })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.primary, bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.fg_muted })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = colors.fg_muted })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.primary, bold = true })

-- Selection & Search
-- vim.api.nvim_set_hl(0, "Visual", { bg = colors.bg_visual })
-- vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.bg_visual })
-- vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.yellow })
-- vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.orange })
-- vim.api.nvim_set_hl(0, "CurSearch", { fg = colors.bg, bg = colors.orange })

-- Statusline & Tabline
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg_statusline })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.fg_muted, bg = colors.bg_statusline })
-- vim.api.nvim_set_hl(0, "TabLine", { fg = colors.fg_muted, bg = colors.bg_statusline })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.bg_statusline })
-- vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })

-- Popup Menu (completion)
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = colors.bg_float })
-- vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.bg, bg = colors.primary })
-- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.bg_highlight })
-- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.fg_muted })

-- ============================================================================
-- SYNTAX (Traditional groups)
-- ============================================================================
-- vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
-- vim.api.nvim_set_hl(0, "String", { fg = colors.green })
-- vim.api.nvim_set_hl(0, "Character", { fg = colors.green })
-- vim.api.nvim_set_hl(0, "Number", { fg = colors.orange })
-- vim.api.nvim_set_hl(0, "Boolean", { fg = colors.orange })
-- vim.api.nvim_set_hl(0, "Float", { fg = colors.orange })

-- vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
-- vim.api.nvim_set_hl(0, "Function", { fg = colors.yellow })
--
-- vim.api.nvim_set_hl(0, "Statement", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Conditional", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Repeat", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Label", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Operator", { fg = colors.fg })
-- vim.api.nvim_set_hl(0, "Keyword", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Exception", { fg = colors.purple })
--
-- vim.api.nvim_set_hl(0, "PreProc", { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, "Include", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Define", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Macro", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "PreCondit", { fg = colors.purple })
--
-- vim.api.nvim_set_hl(0, "Type", { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.purple })
-- vim.api.nvim_set_hl(0, "Structure", { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, "Typedef", { fg = colors.cyan })
--
-- vim.api.nvim_set_hl(0, "Special", { fg = colors.blue })
-- vim.api.nvim_set_hl(0, "SpecialChar", { fg = colors.orange })
-- vim.api.nvim_set_hl(0, "Tag", { fg = colors.red })
-- vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.fg })
-- vim.api.nvim_set_hl(0, "SpecialComment", { fg = colors.comment })
-- vim.api.nvim_set_hl(0, "Debug", { fg = colors.red })
--
-- vim.api.nvim_set_hl(0, "Underlined", { underline = true })
-- vim.api.nvim_set_hl(0, "Error", { fg = colors.red })
-- vim.api.nvim_set_hl(0, "Todo", { fg = colors.purple, bold = true })

-- ============================================================================
-- TREESITTER (Link to traditional groups)
-- ============================================================================
-- Comments
-- vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
-- vim.api.nvim_set_hl(0, "@comment.documentation", { link = "Comment" })

-- Constants
-- vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
-- vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Special" })
-- vim.api.nvim_set_hl(0, "@constant.macro", { link = "Define" })

-- Strings
-- vim.api.nvim_set_hl(0, "@string", { link = "String" })
-- vim.api.nvim_set_hl(0, "@string.escape", { link = "SpecialChar" })
-- vim.api.nvim_set_hl(0, "@string.special", { link = "SpecialChar" })
-- vim.api.nvim_set_hl(0, "@character", { link = "Character" })
-- vim.api.nvim_set_hl(0, "@number", { link = "Number" })
-- vim.api.nvim_set_hl(0, "@boolean", { link = "Boolean" })
-- vim.api.nvim_set_hl(0, "@float", { link = "Float" })

-- Functions
-- vim.api.nvim_set_hl(0, "@function", { link = "Function" })
-- vim.api.nvim_set_hl(0, "@function.builtin", { link = "Special" })
-- vim.api.nvim_set_hl(0, "@function.call", { link = "Function" })
-- vim.api.nvim_set_hl(0, "@function.macro", { link = "Macro" })
-- vim.api.nvim_set_hl(0, "@method", { link = "Function" })
-- vim.api.nvim_set_hl(0, "@method.call", { link = "Function" })
-- vim.api.nvim_set_hl(0, "@constructor", { link = "Special" })
-- vim.api.nvim_set_hl(0, "@parameter", { link = "Identifier" })

-- Keywords
-- vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
-- vim.api.nvim_set_hl(0, "@keyword.function", { link = "Keyword" })
-- vim.api.nvim_set_hl(0, "@keyword.operator", { link = "Operator" })
-- vim.api.nvim_set_hl(0, "@keyword.return", { link = "Keyword" })
-- vim.api.nvim_set_hl(0, "@conditional", { link = "Conditional" })
-- vim.api.nvim_set_hl(0, "@repeat", { link = "Repeat" })
-- vim.api.nvim_set_hl(0, "@label", { link = "Label" })
-- vim.api.nvim_set_hl(0, "@operator", { link = "Operator" })
-- vim.api.nvim_set_hl(0, "@exception", { link = "Exception" })

-- Types
-- vim.api.nvim_set_hl(0, "@type", { link = "Type" })
-- vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })
-- vim.api.nvim_set_hl(0, "@type.definition", { link = "Typedef" })
-- vim.api.nvim_set_hl(0, "@storageclass", { link = "StorageClass" })
-- vim.api.nvim_set_hl(0, "@namespace", { link = "Identifier" })
-- vim.api.nvim_set_hl(0, "@include", { link = "Include" })
-- vim.api.nvim_set_hl(0, "@preproc", { link = "PreProc" })

-- Variables
-- vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
-- vim.api.nvim_set_hl(0, "@variable.builtin", { link = "Special" })
-- vim.api.nvim_set_hl(0, "@property", { link = "Identifier" })
-- vim.api.nvim_set_hl(0, "@field", { link = "Identifier" })

-- Text (for markup languages)
-- vim.api.nvim_set_hl(0, "@text", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "@text.strong", { bold = true })
-- vim.api.nvim_set_hl(0, "@text.emphasis", { italic = true })
-- vim.api.nvim_set_hl(0, "@text.underline", { underline = true })
-- vim.api.nvim_set_hl(0, "@text.title", { link = "Title" })
-- vim.api.nvim_set_hl(0, "@text.literal", { link = "String" })
-- vim.api.nvim_set_hl(0, "@text.uri", { link = "Underlined" })

-- Punctuation
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Delimiter" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Delimiter" })
-- vim.api.nvim_set_hl(0, "@punctuation.special", { link = "Delimiter" })

-- Tags (HTML/XML/JSX)
-- vim.api.nvim_set_hl(0, "@tag", { link = "Tag" })
-- vim.api.nvim_set_hl(0, "@tag.attribute", { link = "Identifier" })
-- vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "Delimiter" })

-- ============================================================================
-- LSP / DIAGNOSTICS
-- ============================================================================
-- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
-- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })
--
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

-- ============================================================================
-- GIT SIGNS (if using gitsigns.nvim)
-- ============================================================================
-- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })
-- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.red })

-- ============================================================================
-- DIFF
-- ============================================================================
-- vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.green, bg = colors.bg_highlight })
-- vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.yellow, bg = colors.bg_highlight })
-- vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red, bg = colors.bg_highlight })
-- vim.api.nvim_set_hl(0, "DiffText", { fg = colors.blue, bg = colors.bg_highlight })
