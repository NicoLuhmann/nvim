return {
	"nvim-lualine/lualine.nvim",
	cond = not vim.g.vscode,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_c = {
					{ "filename", path = 4 },
				},
				lualine_x = {},
				lualine_y = {
					"encoding",
					"fileformat",
					"filetype",
				},
			},
			inactive_sections = {
				lualine_c = {
					{
						"filename",
						path = 3,
					},
				},
			},
		})
	end,
}
