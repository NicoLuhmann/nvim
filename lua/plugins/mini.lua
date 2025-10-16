return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require('mini.ai').setup()
		require('mini.comment').setup()
		require('mini.surround').setup({
		  mappings = {
			add = '<leader>msa', -- Add surrounding in Normal and Visual modes
			delete = '<leader>msd', -- Delete surrounding
			find = '<leader>msf', -- Find surrounding (to the right)
			find_left = '<leader>msF', -- Find surrounding (to the left)
			highlight = '<leader>msh', -- Highlight surrounding
			replace = '<leader>msr', -- Replace surrounding
		  }
		})
		require('mini.pairs').setup()
		require('mini.splitjoin').setup()
		if not vim.g.vscode then
			require('mini.icons').setup()
			require('mini.statusline').setup()
		end
	end,
}
