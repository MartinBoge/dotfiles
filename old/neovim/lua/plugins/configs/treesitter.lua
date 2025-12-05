return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- the first five listed parsers should always be installed
			ensure_installed = {
				"c", -- mandatory
				"lua", -- mandatory
				"vim", -- mandatory
				"vimdoc", -- mandatory
				"query", -- mandatory
				"python",
				"rust",
				"javascript",
				"html",
				"css",
				"markdown",
				"yaml",
				"bash",
				"toml",
				"dockerfile",
				"gitignore",
				"sql",
				"svelte",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
