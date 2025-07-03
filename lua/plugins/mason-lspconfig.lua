return {
  "mason-org/mason-lspconfig.nvim",
	cond = not vim.g.vscode and (NVIM_MODE ~= "min"),
  dependencies = {
    "williamboman/mason.nvim",
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
      "marksman",
      "yamlls",
      "bashls",
      "cmake",
      "lemminx", -- xml
    },
    automatic_enable = true,
  },
}
