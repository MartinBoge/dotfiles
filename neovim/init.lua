-- Common settings
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for all yank, delete, and paste operations (may require external provider on linux)
vim.opt.autoread = true -- Reload files when changed outside of Neovim
vim.opt.cursorline = true -- Highlights the line where the cursor is at

vim.cmd.colorscheme("martycolor")

-- Key mappings: Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Key mappings: Buffers
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<s-tab>", "<cmd>bp<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>bd!<cr>", { desc = "Delete buffer without writing" })
vim.keymap.set("n", "<leader>bw", "<cmd>w|bd<cr>", { desc = "Write and delete buffer" })
-- Key mappings: File navigation
vim.keymap.set("n", "<c-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<c-u>", "<C-u>zz", { desc = "Half page up (centered)" })
-- Key mappings: Search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
-- Key mappings: Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Key mappings: Diagnostics
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostics (under the cursor)" })
vim.keymap.set("n", "<leader>db", vim.diagnostic.setloclist, { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>da", vim.diagnostic.setqflist, { desc = "All diagnostics" })
-- Key mappings: Refactor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

-- Tab and space defaults
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing

-- File type specific indentation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.expandtab = false
	end,
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter").install({
					"lua",
					"regex",
					"bash",
					"nix",
					"python",
					"html",
					"javascript",
					"typescript",
					"svelte",
					"tsx",
					"go",
					"rust",
				})

				vim.api.nvim_create_autocmd("FileType", {
					pattern = {
						"lua",
						"regex",
						"bash",
						"nix",
						"python",
						"html",
						"javascript",
						"typescript",
						"svelte",
						"javascriptreact",
						"typescriptreact",
						"go",
						"rust",
					},
					callback = function()
						vim.treesitter.start()
					end,
				})
			end,
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		},
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
			},
			keys = {
				{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
			},
		},
		{
			"stevearc/conform.nvim",
			event = "VeryLazy",
			opts = {
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					markdown = { "prettier" },
					yaml = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					nix = { "nixfmt" },
					python = {
						"ruff_fix",
						"ruff_format",
						"ruff_organize_imports",
					},
					html = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					svelte = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					go = { "gofmt" },
					rust = { "rustfmt" },
				},
			},
		},
		{
			"saghen/blink.cmp",
			event = "VeryLazy",
			dependencies = { "rafamadriz/friendly-snippets" },
			version = "1.*",
			opts = {
				keymap = { preset = "enter" },
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = { documentation = { auto_show = true } },
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
			},
			opts_extend = { "sources.default" },
		},
		{
			"akinsho/bufferline.nvim",
			event = "VeryLazy",
			version = "*",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				options = {
					numbers = "ordinal",
				},
			},
			keys = {
				{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
				{ "<leader>-1", "<cmd>BufferLineGoToBuffer -1<cr>", desc = "Go to buffer -1" },
				{ "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1" },
				{ "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2" },
				{ "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3" },
				{ "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4" },
				{ "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5" },
				{ "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to buffer 6" },
				{ "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to buffer 7" },
				{ "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to buffer 8" },
				{ "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to buffer 9" },
			},
		},
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "lewis6991/gitsigns.nvim", event = "VeryLazy", opts = {} },
		{
			"nvim-telescope/telescope.nvim",
			tag = "v0.2.0",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {},
			keys = {
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
				{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
			},
		},
		{ "nvim-mini/mini.pairs", event = "InsertEnter", version = "*", opts = {} },
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			lazy = false, -- neo-tree will lazily load itself
			opts = {
				window = {
					position = "current",
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
				},
			},
			keys = {
				{ "<leader>e", "<cmd>Neotree<cr>", desc = "Open file explorer" },
				{ "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in explorer" },
			},
			config = function(_, opts)
				require("neo-tree").setup(opts)

				-- Open neo-tree when deleting the last buffer
				vim.api.nvim_create_autocmd("BufDelete", {
					callback = function()
						vim.schedule(function()
							local has_content = false
							local empty_bufs = {}

							for _, buf in ipairs(vim.api.nvim_list_bufs()) do
								if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
									local name = vim.fn.bufname(buf)
									if name ~= "" then
										has_content = true
									elseif vim.bo[buf].buftype == "" and not vim.bo[buf].modified then
										table.insert(empty_bufs, buf)
									end
								end
							end

							if not has_content then
								vim.cmd("Neotree")
								for _, buf in ipairs(empty_bufs) do
									vim.api.nvim_buf_delete(buf, { force = false })
								end
							end
						end)
					end,
				})
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {},
		},
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			opts = {},
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
		},
	},
})

-- Configs at: https://github.com/neovim/nvim-lspconfig
vim.lsp.enable({ "lua_ls", "nixd", "pyright", "html", "ts_ls", "svelte", "gopls", "rust_analyzer" })
