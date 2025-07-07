return {
	"obsidian-nvim/obsidian.nvim",
	cond = not vim.g.vscode and NVIM_MODE == "max",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/vault/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/vault/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
		"folke/snacks.nvim",
		"nvim-treesitter/nvim-treesitter",
		"MeanderingProgrammer/render-markdown.nvim",
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "~/vault",
			},
		},

		notes_subdir = "",

		note_id_func = function(title)
			return title
		end,

		disable_frontmatter = true,

		daily_notes = {
			folder = "dailies",
			workdays_only = false,
		},

		completion = {
			nvim_cmp = false,
			blink = true,
		},

		picker = {
			name = "snacks.pick",
		},

		ui = {
			enable = false,
		},
	},
}
