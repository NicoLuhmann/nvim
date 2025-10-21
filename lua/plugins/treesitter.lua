return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	version = "false",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = not vim.g.vscode, -- Disable highlighting in VSCode
		},
		indent = {
			enable = not vim.g.vscode, -- Disable indenting in VSCode
		},
		ensure_installed = {
			"markdown",
			"markdown_inline",
			"regex",
			"bash",
		},
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
	end,
}
