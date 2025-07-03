return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  cond = not vim.g.vscode and NVIM_MODE == "max",
  opts = {
    default = {
      extension = "webp",
      process_cmd = "convert - -quality 75 webp:-",
    },
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    { "<leader>v", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
