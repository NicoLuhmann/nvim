return {
  "mfussenegger/nvim-lint",
	enabled = NVIM_MODE ~= "min",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function()
    require('lint').linters_by_ft = {}
  end,
}
