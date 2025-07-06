if NVIM_MODE == "max" then
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
	end
	local L = "<localleader>"

	-- Info & Document Actions
	map("n", L .. "li", "<plug>(vimtex-info)", "Tex: Info")
	map("n", L .. "lI", "<plug>(vimtex-info-full)", "Tex: Full Info")
	map("n", L .. "lto", "<plug>(vimtex-toc-open)", "Tex: Open TOC")
	map("n", L .. "ltt", "<plug>(vimtex-toc-toggle)", "Tex: Toggle TOC")
	map("n", L .. "lq", "<plug>(vimtex-log)", "Tex: Log")
	map("n", L .. "lv", "<plug>(vimtex-view)", "Tex: View in PDF")
	map("n", L .. "lr", "<plug>(vimtex-reverse-search)", "Tex: Reverse Search")
	map("n", L .. "ll", "<plug>(vimtex-compile)", "Tex: Compile")
	map("n", L .. "ls", "<plug>(vimtex-stop)", "Tex: Stop Compile")
	map("n", L .. "lS", "<plug>(vimtex-stop-all)", "Tex: Stop All")
	map("n", L .. "le", "<plug>(vimtex-errors)", "Tex: Errors")
	map("n", L .. "lo", "<plug>(vimtex-compile-output)", "Tex: Compile Output")
	map("n", L .. "lg", "<plug>(vimtex-status)", "Tex: Status")
	map("n", L .. "lG", "<plug>(vimtex-status-all)", "Tex: Status All")
	map("n", L .. "lc", "<plug>(vimtex-clean)", "Tex: Clean")
	map("n", L .. "lC", "<plug>(vimtex-clean-full)", "Tex: Clean Full")
	map("n", L .. "lx", "<plug>(vimtex-reload)", "Tex: Reload")
	map("n", L .. "lX", "<plug>(vimtex-reload-state)", "Tex: Reload State")
	map("n", L .. "lm", "<plug>(vimtex-toggle-main)", "Tex: Toggle Main")
	map("n", L .. "la", "<plug>(vimtex-context-menu)", "Tex: Context Menu")

	-- Surrounding / Text Objects
	map("n", L .. "dse", "<plug>(vimtex-env-delete)", "Tex: Delete Env")
	map("n", L .. "dsc", "<plug>(vimtex-cmd-delete)", "Tex: Delete Cmd")
	map("n", L .. "ds$", "<plug>(vimtex-env-delete-math)", "Tex: Delete Math Env")
	map("n", L .. "dsd", "<plug>(vimtex-delim-delete)", "Tex: Delete Delimiter")

	map("n", L .. "cse", "<plug>(vimtex-env-change)", "Tex: Change Env")
	map("n", L .. "csc", "<plug>(vimtex-cmd-change)", "Tex: Change Cmd")
	map("n", L .. "cs$", "<plug>(vimtex-cmd-change-math)", "Tex: Change Math Cmd")
	map("n", L .. "csd", "<plug>(vimtex-delim-change-math)", "Tex: Change Math Delim")

	map("n", L .. "tsc", "<plug>(vimtex-cmd-toggle-star)", "Tex: Toggle Star Cmd")
	map("n", L .. "tse", "<plug>(vimtex-env-toggle)", "Tex: Toggle Env")
	map("n", L .. "ts$", "<plug>(vimtex-env-toggle-math)", "Tex: Toggle Math Env")
	map("n", L .. "tsd", "<plug>(vimtex-delim-toggle-modifier)", "Tex: Toggle Delim Mod")
	map("n", L .. "tsf", "<plug>(vimtex-cmd-toggle-frac)", "Tex: Toggle Fraction")
	map("n", L .. "tss", "<plug>(vimtex-env-toggle-star)", "Tex: Toggle Star Env")
	map("n", L .. "tsb", "<plug>(vimtex-env-toggle-break)", "Tex: Toggle Break")
	map("n", L .. "tsD", "<plug>(vimtex-delim-toggle-modifier-reverse)", "Tex: Toggle Delim Mod Rev")

	-- Surrounding in operator, normal, visual
	map("n", L .. "ys", "<plug>(vimtex-env-surround-operator)", "Tex: Surround Op")
	map("x", L .. "ys", "<plug>(vimtex-env-surround-visual)", "Tex: Surround Visual")

	map("i", "]]", "<plug>(vimtex-delim-close)", "Tex: Delim Close")

	-- Text objects
	for _, t in ipairs({ "ac", "ic", "ad", "id", "ae", "ie", "a$", "i$", "aP", "iP", "am", "im" }) do
		map({ "x", "o" }, t, "<plug>(vimtex-" .. t .. ")", "Tex: " .. t)
	end
	-- Sections (jump between \section, \subsection, etc.)
	map({ "n", "x", "o" }, "[[", "<plug>(vimtex-[[)", "Tex: Next section start")
	map({ "n", "x", "o" }, "[]", "<plug>(vimtex-[])", "Tex: Next section end")
	map({ "n", "x", "o" }, "][", "<plug>(vimtex-][)", "Tex: Prev section end")
	map({ "n", "x", "o" }, "]]", "<plug>(vimtex-]])", "Tex: Prev section start")

	-- Environments (\begin{...} / \end{...})
	map({ "n", "x", "o" }, "[m", "<plug>(vimtex-[m)", "Tex: Prev env start")
	map({ "n", "x", "o" }, "[M", "<plug>(vimtex-[M)", "Tex: Prev env end")
	map({ "n", "x", "o" }, "]m", "<plug>(vimtex-]m)", "Tex: Next env start")
	map({ "n", "x", "o" }, "]M", "<plug>(vimtex-]M)", "Tex: Next env end")

	-- Math environments (e.g. $, $$, \[…\], equation)
	map({ "n", "x", "o" }, "[n", "<plug>(vimtex-[n)", "Tex: Prev math start")
	map({ "n", "x", "o" }, "[N", "<plug>(vimtex-[N)", "Tex: Prev math end")
	map({ "n", "x", "o" }, "]n", "<plug>(vimtex-]n)", "Tex: Next math start")
	map({ "n", "x", "o" }, "]N", "<plug>(vimtex-]N)", "Tex: Next math end")

	-- Frames (for Beamer: \begin{frame} / \end{frame})
	map({ "n", "x", "o" }, "[r", "<plug>(vimtex-[r)", "Tex: Prev frame start")
	map({ "n", "x", "o" }, "[R", "<plug>(vimtex-[R)", "Tex: Prev frame end")
	map({ "n", "x", "o" }, "]r", "<plug>(vimtex-]r)", "Tex: Next frame start")
	map({ "n", "x", "o" }, "]R", "<plug>(vimtex-]R)", "Tex: Next frame end")

	-- Comments
	map({ "n", "x", "o" }, "[*", "<plug>(vimtex-[star)", "Tex: Prev comment start")
	map({ "n", "x", "o" }, "]*", "<plug>(vimtex-]star)", "Tex: Next comment end")

	-- Matching delimiters (\begin/\end, braces, fences)
	map({ "n", "x", "o" }, "%", "<plug>(vimtex-%)", "Tex: Match delimiter")
	map("n", "<localleader>K", "<plug>(vimtex-doc-package)", "Tex: Doc Package")
end
