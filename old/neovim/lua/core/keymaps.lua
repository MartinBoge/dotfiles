local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Explorer
keymap("n", "<leader>ef", "<cmd>Ex<CR>")

-- Tabs
keymap("n", "<leader>tn", "<cmd>tabnew<CR>")
keymap("n", "<leader>tc", "<cmd>tabclose<CR>")
keymap("n", "<leader>to", "<cmd>tabonly<CR>")
keymap("n", "<leader>t+", "<cmd>+tabnext<CR>")
keymap("n", "<leader>t-", "<cmd>-tabnext<CR>")

-- Navigation
keymap("n", "J", "10j")
keymap("n", "K", "10k")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Move selection
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- System clipboard
keymap("n", "<leader>y", '"*y')
keymap("v", "<leader>y", '"*y')
