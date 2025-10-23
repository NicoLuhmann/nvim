return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"markdown",
			"markdown_inline",
			"regex",
			"bash",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				if not vim.g.vscode then
					local ok = pcall(vim.treesitter.start)
					if ok then
						vim.wo.foldmethod = "expr"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end
			end,
		})
	end,
}
