return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			opts = {
				nes = {
					enabled = false,
				},
				panel = {
					enabled = true,
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
					keymap = {
						next = "<M-n>",
						prev = "<M-p>",
						dismiss = "<M-e>",
						accept = "<M-y>",
						-- Or granular acceptance:
						accept_word = "<M-w>",
						accept_line = "<M-q>",
					},
					filetypes = {
						yaml = true,
						markdown = true,
					},
				},
			},
		},
		{ "nvim-lua/plenary.nvim" },
	},
  -- build = "make tiktoken",
	opts = {},
	keys = {
		{
			"<leader>ai",
			":CopilotChatToggle<CR>",
			mode = "n",
			desc = "Toggle Chat window",
		},
		{
			"<leader>ae",
			":CopilotChatExplain<CR>",
			mode = "v",
			desc = "Explain code",
		},
		{
			"<leader>ar",
			":CopilotChatReview<CR>",
			mode = "v",
			desc = "Review code",
		},
		{
			"leader>af",
			":CopilotChatFix<CR>",
			mode = "v",
			desc = "Fix code",
		},
		{
			"leader>ao",
			":CopilotChatOptimize<CR>",
			mode = "v",
			desc = "Optimize code",
		},
		{
			"leader>at",
			":CopilotChatTests<CR>",
			mode = "v",
			desc = "Generate tests for code",
		},
		{
			"leader>ac",
			":CopilotChatCommit<CR>",
			mode = "v",
			desc = "Generate commit message",
		},
	},
}
