return {
	"folke/snacks.nvim",
	priority = 1000,
	cond = not vim.g.vscode,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "p", desc = "Pick File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "f",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{ icon = " ", key = "e", desc = "Explorer", action = ":lua Snacks.explorer()" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{ icon = " ", key = "h", desc = "Health Check", action = ":checkhealth" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
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
				explorer = {
					layout = {
						preview = true,
						layout = { position = "right" },
					},
				},
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
			"<leader>bb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Pick Buffer",
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
			"<leader>dd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
	},
}
