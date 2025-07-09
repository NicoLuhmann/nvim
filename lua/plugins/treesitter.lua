return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = not vim.g.vscode, -- Disable highlighting in VSCode
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = not vim.g.vscode, -- Disable indenting in VSCode
		},
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"html",
			"javascript",
			"json",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"norg",
			"python",
			"regex",
			"scss",
			"svelte",
			"toml",
			"tsx",
			"typst",
			"typescript",
			"vue",
			"yaml",
		},
		auto_install = false,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}