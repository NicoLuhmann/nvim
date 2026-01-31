return {
  "catppuccin/nvim",
  cond = not vim.g.vscode,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup{
      integrations = {
        mini = {
          enabled = true,
          indentscope_color ="",
        },
        snacks = {
          enabled = true,
          indentscope_color = "",
        },
      }
    }
  end,
}
