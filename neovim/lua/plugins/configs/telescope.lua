return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")

		local keymap = vim.keymap.set

		keymap("n", "<leader>FF", builtin.find_files, {})
		keymap("n", "<leader>ff", builtin.git_files, {})
		keymap("n", "<leader>fg", builtin.live_grep, {})
		keymap("n", "<leader>fb", builtin.buffers, {})
	end,
}
