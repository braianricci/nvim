local state = {
    floating = {}
}

local function create_fterminal(buf)
    local width  = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines   * 0.8)

    local col = math.floor((vim.o.columns - width)  / 2)
    local row = math.floor((vim.o.lines   - height) / 2)

    -- reuse buf or create new
    if not (buf and vim.api.nvim_buf_is_valid(buf)) then
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    })

    return buf, win
end

local function toggle_terminal(opts)
    local id = tonumber(opts.args)
	if not id then return end

    if not state.floating[id] then
        state.floating[id] = { buf = nil, win = nil }
    end

    local term = state.floating[id]

    -- window closed? reopen
    if not (term.win and vim.api.nvim_win_is_valid(term.win)) then
        term.buf, term.win = create_fterminal(term.buf)

        -- make terminal only once
        if vim.bo[term.buf].buftype ~= "terminal" then
            vim.cmd("terminal")
        end
        vim.cmd("startinsert")
        return
    end

    -- window exists → hide it
    vim.api.nvim_win_hide(term.win)
end

vim.api.nvim_create_user_command("Fterminal", toggle_terminal, {
    nargs = 1,
    complete = function() return { "1","2","3","4","5","6","7","8","9" } end,
})
