return {
	"folke/lazydev.nvim",
	cond = NVIM_MODE ~= "min",
	ft = "lua",
	opts = {
		library = {
			{ path = "{3rd}/luv-library", words = { "vim%.uv" } },
			{ path = "plugins", words = { "Snacks" } },
		},
	},
}
