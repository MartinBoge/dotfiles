return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- disable netrw before calling setup
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			view = {
				width = 40,
			},
		})

		local keymap = vim.keymap.set

		keymap("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
		keymap("n", "<leader>et", "<cmd>NvimTreeToggle<CR>")
		keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
		keymap("n", "<C-w>o", "<C-w>o<cmd>NvimTreeToggle<CR><C-w>l><ESC>")
	end,
}
