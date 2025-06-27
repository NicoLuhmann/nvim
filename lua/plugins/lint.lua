return {
  "mfussenegger/nvim-lint",
	enabled = NVIM_MODE ~= "min",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  opts = {

  },
}
