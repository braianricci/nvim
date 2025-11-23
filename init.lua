----------------oO0 basics 0Oo----------------

vim.o.shell = "powershell"
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

-- write, save, write and save, source, clean search
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>x", ":wq<CR>", opts)
map("n", "<leader>o", ":update<CR> :source<CR>", opts)
map("n", "<Esc>", ":<cmd>nohlsearch<CR>", opts)

-- copy, cut and paste to/from system clipboard
map({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
map({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
map({ "n", "v", "x" }, "<leader>p", '"+p<CR>')

-- splits creation, resizing, navigation
map("n", "<leader>s", ":split<CR>", opts)
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<C-Left>", ":vertical resize +3<CR>", opts)
map("n", "<C-Right>", ":vertical resize -3<CR>", opts)
map("n", "<C-Up>", ":horizontal resize +3<CR>", opts)
map("n", "<C-Down>", ":horizontal resize -3<CR>", opts)
map("n", "<BS>", "<C-w>h", opts) --C-h is backspace, so I have to rebind <BS> too
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- scroll
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- insert esc, pairs
map("i", "kj", "<Esc>", opts)
map("i", "jk", "<Esc>", opts)
map("i", "'", "''<left>", opts)
map("i", '"', '""<left>', opts)
map("i", "(", "()<left>", opts)
map("i", "{", "{}<left>", opts)
map("i", "[", "[]<left>", opts)
map("i", "<", "<><left>", opts)

-- visual map, move
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '>-2<CR>gv=gv", opts)

-- format
map("n", "<leader>r", function() vim.lsp.buf.format({ async = true }) end, opts)

-- pick files and help
map("n", "<leader>ff", ":Pick files<CR>")
map("n", "<leader>fh", ":Pick help<CR>")

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
map("t", "<Esc>", [[<C-\><C-n>]], opts)
map("n", "<leader>1", ":Fterminal 1<CR>", opts)
map("n", "<leader>2", ":Fterminal 2<CR>", opts)
map("n", "<leader>3", ":Fterminal 3<CR>", opts)
map("n", "<leader>4", ":Fterminal 4<CR>", opts)
map("n", "<leader>5", ":Fterminal 5<CR>", opts)

-- tabs
map("n", "<leader><Tab>", function()
	vim.cmd("tabedit .")
end, opts)
map("n", "<Tab>", "gt", opts)
map("n", "<S-Tab>", "gT", opts)

-- harpoon-like
map("n", "<leader>a", function()
	vim.cmd("argadd %")
	vim.cmd("argdedup")
end)


----------------oO0 plugins 0Oo----------------

vim.pack.add({
	-- themes
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/vague2k/vague.nvim",
	-- funtionalities
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/echasnovski/mini.pick",
	"https://github.com/chomosuke/typst-preview.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
	"https://github.com/github/copilot.vim",
	"https://github.com/BourgeoisBear/clrzr" --not working?
})

require "neoscroll".setup({
	duration_multiplier = 0.2,   -- Global duration multiplier
  	easing = 'sine',           -- Default easing function	
})
require "mini.pick".setup()
require "oil".setup()
require "mason".setup()
require "plenary"
require "copilotchat".setup({
	model = "gpt-4o",
})
require "fterminal" --mine

vim.lsp.enable({ "lua_ls" })


----------------oO0 style 0Oo----------------

--vim.cmd("colorscheme vague")
vim.cmd("colorscheme gruvbox")
vim.cmd(":highlight StatusLine guibg=#a36f51 ctermbg=none")
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

vim.o.fillchars = "stl:─"
vim.o.statusline = "%= %m[%f] %l/%L"
