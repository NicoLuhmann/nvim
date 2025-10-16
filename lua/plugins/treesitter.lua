return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
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
      "bash"
		},
		auto_install = false,
	},
	config = function (_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
