return {
  "neovim/nvim-lspconfig",
	cond = not vim.g.vscode and (NVIM_MODE ~= "min"),
  dependencies = {
    "folke/lazydev.nvim",
    "mason-org/mason.nvim",
  },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
  },
}
