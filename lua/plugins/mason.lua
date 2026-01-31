return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		priority = 1000,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cond = not vim.g.vscode,
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"clangd",
				"cmake",
				"dockerls",
				"jsonls",
				"lemminx", -- xml
				"lua_ls",
				"pyright",
				"yamlls",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cond = not vim.g.vscode,
		opts = {
			ensure_installed = {
				"black",
				"clang-format",
				"gersemi",
				"isort",
				"prettierd",
				"prettier",
        "shfmt",
				"stylua",
				"tree-sitter-cli",
				"xmlformatter",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
