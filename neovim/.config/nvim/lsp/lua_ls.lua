return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	before_init = require("lazydev.lsp").before_init,
	root_markers = {
		".emmyrc.json",
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			codeLens = { enable = true },
			hint = { enable = true, semicolon = "Disable" },
			workspace = { checkThirdParty = false },
		},
	},
}
