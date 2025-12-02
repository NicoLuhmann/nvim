return {
	{
		"saghen/blink.cmp",
		cond = not vim.g.vscode,
		version = "1.*",
		dependencies = {
      { "folke/lazydev.nvim", opts = {} },
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = false },
				ghost_text = {
					show_with_selection = false,
					show_with_menu = false,
					show_without_menu = false,
				},
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
