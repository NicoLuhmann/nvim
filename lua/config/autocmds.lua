vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 1000 })
	end,
	desc = "Highlight on yank",
})

-- Use 4 spaces for indentation in languages where this is the common convention
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"python",
		"c",
		"cpp",
		"java",
		"cmake",
		"rust",
	},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
})
-- Use 2 spaces for indentation in languages where this is the common convention
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"javascript",
		"typescript",
		"json",
		"yaml",
		"css",
		"html",
		"dockerfile",
		"toml",
		"markdown",
		"markdown_inline",
		"bash",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
