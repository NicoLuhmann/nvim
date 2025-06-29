return {
	"folke/snacks.nvim",
	priority = 1000,
	cond = not vim.g.vscode,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			hidden = true,
			ignored = true,
			ui_select = true,
			sources = {
				files = {
					hidden = true,
					ignored = true,
					exclude = {
						"**/.git/*",
					},
				},
			},
		},
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
	},
	keys = {
		{
			"<leader>lg",
			function()
				require("snacks").lazygit.open()
			end,
			desc = "Open LazyGit (Snacks)",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>p",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<leader>to",
			function()
				Snacks.terminal.open()
			end,
			desc = "Open a new terminal window",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
	},
}
