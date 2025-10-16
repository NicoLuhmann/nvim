return {
  {
    "folke/lazydev.nvim",
	cond = not vim.g.vscode,
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	cond = not vim.g.vscode,
	version = "1.*",
    opts = {
      keymap = { preset = 'default' },
	  appearance = {
		nerd_font_variant = 'mono'
	  },
	  completion = { documentation = { auto_show = false } },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
	  fuzzy = { implementation = "prefer_rust_with_warning" }
    },
	opts_extend = { "sources.default" }
  }
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
