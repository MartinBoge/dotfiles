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
				width = 60,
			},
		})

		local keymap = vim.keymap.set

		keymap("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Explorer: Focus" })
		keymap("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer: Toggle visibility" })
		keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Explorer: Collapse all folders" })
		keymap(
			"n",
			"<C-w>o",
			"<C-w>o<cmd>NvimTreeToggle<CR><C-w>l><ESC>",
			{ desc = "Close all but current window and tree" }
		)
		keymap(
			"n",
			"<leader>ew",
			"<cmd>NvimTreeFocus<CR><cmd>vertical resize +10<CR>",
			{ desc = "Explorer: Widen by 10 columns" }
		)
		keymap(
			"n",
			"<leader>en",
			"<cmd>NvimTreeFocus<CR><cmd>vertical resize -10<CR>",
			{ desc = "Explorer: Narrow by 10 columns" }
		)
	end,
}
