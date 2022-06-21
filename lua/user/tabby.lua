local components = function()
	local coms = {}
	local cur_bufid = vim.api.nvim_get_current_buf()
	for _, bufid in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufid) and vim.bo[bufid].buflisted then
			local hl = "TabLine"
			if bufid == cur_bufid then
				hl = "TabLineSel"
			end
			local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufid), ":~:.")
			table.insert(coms, {
				type = "text",
				text = {
					string.format(" %d: %s ", bufid, buf_name),
					hl = hl,
				},
			})
			table.insert(coms, {
				type = "text",
				text = {
					" ",
					hl = "TabLineFill",
				},
			})
		end
	end
	return coms
end
require("tabby").setup({
	components = components,
})
