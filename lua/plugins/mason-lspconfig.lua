return {
  "mason-org/mason-lspconfig.nvim",
	cond = not vim.g.vscode,
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    automatic_enable = true,
  },
}
