return {
  "mfussenegger/nvim-lint",
	cond = NVIM_MODE ~= "min",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function()
    require('lint').linters_by_ft = {}
  end,
}
