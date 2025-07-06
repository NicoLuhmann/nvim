return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode and NVIM_MODE == "max",
	opts = {
		default = {
			extension = "webp",
			process_cmd = "convert - -quality 75 webp:-",
			file_name = function()
				-- Get the current buffer's filename without the extension
				local buffer_name = vim.fn.expand("%:t:r")
				-- Get the current timestamp for uniqueness
				local timestamp = os.date("%Y-%m-%d-%H-%M-%S")
				-- Return the desired name WITHOUT the extension
				return buffer_name .. "-" .. timestamp
			end,
		},
		-- add options here
		-- or leave it empty to use the default settings
	},
	keys = {
		{ "<leader>v", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
