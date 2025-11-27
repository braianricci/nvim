local M = {}

function M.TabLine()
	local s = ""
	local current = vim.fn.tabpagenr()
	for i = 1, vim.fn.tabpagenr('$') do
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)
		local bufname = vim.fn.bufname(buflist[winnr])
		local label = ""
		if bufname == "" then
			label = "[No Name]"
		else
			local sep = package.config:sub(1, 1)
			local bufname_normalized = bufname:gsub("\\", "/")
			local parts = vim.split(bufname_normalized, "/")
			local file = parts[#parts] or ""
			local folder = parts[#parts - 1]
			if folder then
				label = folder .. "\\" .. file
			else
				label = file
			end
		end
		if i == current then
			s = s .. "%#TabLineSel#" .. "%" .. i .. "T" .. label .. "%T%#TabLine#   "
		else
			s = s .. "%#TabLine#" .. "%" .. i .. "T" .. label .. "%T   "
		end
	end
	return s
end

return M
