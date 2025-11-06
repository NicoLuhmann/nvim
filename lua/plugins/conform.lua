return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			c = { "clang-format" },
			cpp = { "clang-format" },
			cmake = { "gersemi" },
			css = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			python = { "isort", "black" },
			xml = { "xmlformatter" },
			yaml = { "prettierd", "prettier", stop_after_first = true },
		},
	},
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			desc = "Format file or range (range only in visual mode)",
		},
	},
}
