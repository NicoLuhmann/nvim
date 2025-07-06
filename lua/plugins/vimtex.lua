return {
	"lervag/vimtex",
	lazy = false,
	cond = not vim.g.vscode and NVIM_MODE == "max",
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_imaps_enabled = 0
		vim.g.vimtex_complete_enabled = 0
		vim.g.vimtex_mappings_enabled = 0
		vim.g.vimtex_quickfix_enabled = 0
	end,
}
