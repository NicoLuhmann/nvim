return {
	"folke/noice.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode,
  opts = {
	  presets = {
		  bottom_search = true,
		  command_palette = true,
		  long_message_to_split = true,
		  inc_rename = false,
		  lsp_doc_border = false,
	  },
  },
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
