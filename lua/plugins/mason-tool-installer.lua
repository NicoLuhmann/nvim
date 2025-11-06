return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		ensure_installed = {
			"black",
			"clang-format",
			"gersemi",
			"isort",
			"prettierd",
			"prettier",
			"stylua",
      "tree-sitter-cli",
			"xmlformatter",
		},
		auto_update = false,
		run_on_start = true,
	},
}
