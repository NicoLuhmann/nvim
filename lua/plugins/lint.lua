return {
	"mfussenegger/nvim-lint",
	cond = NVIM_MODE ~= "min",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		require("lint").linters_by_ft = {
			python = { "ruff" },
		}

		vim.keymap.set("n", "<leader>lt", function()
			require("lint").try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
