----------------oO0 basics 0Oo----------------

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 5
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"


----------------oO0 keymaps 0Oo----------------

vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- write, save, write and save, source
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>x", ":wq<CR>", opts)
map("n", "<leader>o", ":update<CR> :source<CR>", opts)

-- copy, cut and paste to/from system clipboard
map({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
map({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
map({ "n", "v", "x" }, "<leader>p", '"+p<CR>')

-- format
map("n", "<leader>r", function() vim.lsp.buf.format({ async = true }) end, opts)

-- pick files and help
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")

-- oil
map("n", "<leader>e", function()
	-- if oil, close it
	if vim.bo.filetype == "oil" then
		vim.cmd("q")
		return
	end

	-- otherwise, open
	require("oil").open_float()
end, opts)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		map("n", "<Esc>", ":q<CR>", { buffer = true })
	end
})

-- terminal
map("n", "<leader>t", function()
	vim.cmd("split | terminal")
	vim.cmd("startinsert")
end, opts)
map("t", "<leader>t", "<C-\\><C-n>:hide<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>:q<CR>", opts)

-- tabs
map("n", "<leader><Tab>", function()
	vim.cmd("tabedit .")
end, opts)
map("n", "<Tab>", "gt", opts)
map("n", "<S-Tab>", "gT", opts)


----------------oO0 plugins 0Oo----------------

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/echasnovski/mini.pairs" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})

require "mini.pick".setup()
require "mini.pairs".setup()
require "oil".setup()

vim.lsp.enable({ "lua_ls" })


----------------oO0 style 0Oo----------------

vim.cmd("colorscheme vague")
vim.cmd(":highlight StatusLine guibg=none ctermbg=none")
vim.cmd(":highlight Normal guibg=none ctermbg=none")
vim.cmd(":highlight NormalNC guibg=none ctermbg=none")
vim.cmd(":highlight VertSplit guibg=none ctermbg=none")
vim.cmd(":highlight LineNR guibg=none ctermbg=none")
vim.cmd(":highlight FoldColumn guibg=none ctermbg=none")
vim.cmd(":highlight SignColumn guibg=none ctermbg=none")
vim.cmd(":highlight winborder guibg=none ctermbg=none")
vim.cmd(":highlight NormalFloat guibg=none ctermbg=none")
vim.cmd(":highlight FloatBorder guibg=none ctermbg=none")
