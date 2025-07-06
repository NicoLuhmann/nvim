return {
  "neovim/nvim-lspconfig",
	cond = not vim.g.vscode and (NVIM_MODE ~= "min"),
  dependencies = {
    "folke/lazydev.nvim",
    "mason-org/mason.nvim",
  },
  config = function()
    -- Set up LSP key mappings when LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        -- Go to definition
        vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, { buffer = ev.buf, desc = "Go to Definition" })
        vim.keymap.set("n", "gD", Snacks.picker.lsp_declarations, { buffer = ev.buf, desc = "Go to Declaration" })
        vim.keymap.set("n", "grt", Snacks.picker.lsp_type_definitions, { buffer = ev.buf, desc = "Go to Type Definition" })
        vim.keymap.set("n", "gri", Snacks.picker.lsp_implementations, { buffer = ev.buf, desc = "Go to Implementation" })
        vim.keymap.set("n", "grr", Snacks.picker.lsp_references, { buffer = ev.buf, desc = "Find References" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover Documentation" })
        vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
        vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
      end,
    })
  end,
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>lrs", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
  },
}
