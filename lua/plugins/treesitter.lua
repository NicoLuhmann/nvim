return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"cpp",
			"cmake",
			"comment",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"toml",
			"yaml",
			"xml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				if not vim.g.vscode then
					local ok = pcall(vim.treesitter.start)
					if ok then
						vim.wo.foldmethod = "expr"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.wo.foldlevel = 99
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end
			end,
		})
	end,
}
