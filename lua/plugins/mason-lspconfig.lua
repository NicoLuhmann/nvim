return {
  "mason-org/mason-lspconfig.nvim",
	cond = not vim.g.vscode and (NVIM_MODE ~= "min"),
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "clangd", -- c and c++ language server
      "dockerls", -- dockerfile language server
      "docker_compose_language_service", -- docker compose language server
      "lua_ls", -- lua language server
      "pyright", -- python language server
      "jsonls",
      "yamlls",
      "bashls",
      "cmake",
      "lemminx", -- xml
      "texlab",
    },
    automatic_enable = true,
  },
}
