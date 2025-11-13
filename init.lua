
----------------oO0 basics 0Oo----------------

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 5
vim.o.foldcolumn = "1"
--vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"


----------------oO0 keymaps 0Oo----------------

vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>x", ":wq<CR>", opts)
map("n", "<leader>o", ":update<CR> :source<CR>", opts)
map({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
map({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
map({ "n", "v", "x" }, "<leader>p", '"+p<CR>')

map("n", "<leader>r", function() vim.lsp.buf.format({ async = true }) end, opts)
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>e", ":Oil<CR>")

map("n", "<leader>t", function ()
		vim.cmd("split | terminal")
		vim.cmd("startinsert")
end, opts)
map("t", "<leader>t", "<C-\\><C-n>:hide<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>:q<CR>", opts)


----------------oO0 plugins 0Oo----------------

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})

require "mini.pick".setup()
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
