return {
	"mfussenegger/nvim-lint",
	cond = not vim.g.vscode,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			javascript = { "eslint_d" },
		}
		
		local lint_augroup = vim.api.nvim_create_augroup("Linting", { clear = true })
		
		local function save_lint()
		  local ft_linters = lint.linters_by_ft[vim.bo.filetype] or {}
		  local available_linters = {}

		  for _, linter_name in ipairs(ft_linters) do
			local linter = lint.linters[linter_name]
			if linter and linter.is_available() then
			  table.insert(available_linters, linter_name)
			end
		  end

		  if #available_linters > 0 then
			lint.try_lint(available_linters)
		  end
		end

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			group = lint_augroup,
			callback = function()
				save_lint()
			end,
		})

		vim.keymap.set("n", "<leader>lt", function()
			local ft_linters = lint.linters_by_ft[vim.bo.filetype] or {}

			if #ft_linters == 0 then
				vim.notify("No linters configured for this filetype", vim.log.levels.WARN)
				return
			end
			
			for _, linter_name in ipairs(ft_linters) do
				local linter = lint.linters[linter_name]
				if linter and not linter.is_available() then
					vim.notify("Linter '" .. linter_name .. "' is not available", vim.log.levels.WARN)
					return
				end
			end
			lint.try_lint(ft_linters)
		end, { desc = "Trigger linting for current file" })
	end,
}
