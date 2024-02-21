--TODO:
--tests
--does .nuxt directory detection using string.concat have better preformance?
--newly created components do not seem to workb

local M = {}

M.is_nuxt_project = false
M.original_definition = vim.lsp.buf.definition

M.setup = function()
	local dirList = vim.fn.systemlist("ls -a")

	for _, dirname in ipairs(dirList) do
		if dirname == ".nuxt" then
			M.is_nuxt_project = true
		end
	end

	if not M.is_nuxt_project then
		return
	end

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		pattern = { "*.vue" },
		callback = function()
			vim.lsp.buf.definition = M.watch
		end,
	})
end

M.watch = function()
	M.original_definition()

	vim.defer_fn(function()
		local line = vim.fn.getline(".")
		local path = string.match(line, '".-/(.-)"')
		local file = vim.fn.expand("%")

		if string.find(file, "components.d.ts") then
			vim.cmd("edit " .. path)
		end
	end, 100)
end

return M
