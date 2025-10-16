return {
    'brianhuster/live-preview.nvim',
    cond = not vim.g.vscode,
    dependencies = {
        -- You can choose one of the following pickers
		'folke/snacks.nvim',
    },
}
