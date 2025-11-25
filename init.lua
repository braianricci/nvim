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
vim.o.laststatus = 3


----------------oO0 keymaps 0Oo----------------

vim.g.mapleader = " "

local function remap(context, shortcut, cmd)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(context, shortcut, cmd, opts)
end

--save and restore session
vim.keymap.set("n", "<leader>ss", function()
    vim.cmd("mksession! " .. vim.fn.stdpath("config") .. "/sessions/session.vim")
    print("Session saved")
end)

vim.keymap.set("n", "<leader>sl", function()
    vim.cmd("source " .. vim.fn.stdpath("config") .. "/sessions/session.vim")
    print("Session restored")
end)

-- write, save, write and save, source, clean search
remap("n", "<leader>w", ":write<CR>")
remap("n", "<leader>q", ":quit<CR>")
remap("n", "<leader>x", ":wq<CR>")
remap("n", "<leader>o", ":update<CR> :source<CR>")
remap("n", "<Esc>", ":nohlsearch<CR>")

-- copy, cut and paste to/from system clipboard
remap({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
remap({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
remap({ "n", "v", "x" }, "<leader>p", '"+p<CR>')

-- splits creation, resizing, navigation
remap("n", "<leader>s", ":split<CR>")
remap("n", "<leader>v", ":vsplit<CR>")
remap("n", "<C-Left>", ":vertical resize +3<CR>")
remap("n", "<C-Right>", ":vertical resize -3<CR>")
remap("n", "<C-Up>", ":horizontal resize +3<CR>")
remap("n", "<C-Down>", ":horizontal resize -3<CR>")
remap("n", "<BS>", "<C-w>h")           --C-h is backspace, so I have to rebind <BS> too
remap({ "n", "v" }, "<C-h>", "<C-w>h") --move to left split
remap({ "n", "v" }, "<C-j>", "<C-w>j") --move to down split
remap({ "n", "v" }, "<C-k>", "<C-w>k") --move to up split
remap({ "n", "v" }, "<C-l>", "<C-w>l") --move to right split
remap("n", "<C-u>", "<C-u>zz")         --scroll up and center
remap("n", "<C-d>", "<C-d>zz")         --scroll down and center

-- copilot chat
remap("n", "<leader>c", ":CopilotChat<CR>")

-- insert esc, pairs
remap("i", "kj", "<Esc>")
remap("i", "jk", "<Esc>")
remap("i", "'", "''<left>")
remap("i", '"', '""<left>')
remap("i", "(", "()<left>")
remap("i", "{", "{}<left>")
remap("i", "[", "[]<left>")
remap("i", "<", "<><left>")

-- visual map, move
remap("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '>-2<CR>gv=gv")

-- format
remap("n", "<leader>r", function() vim.lsp.buf.format({ async = true }) end)

-- pick files and help
remap("n", "<leader>ff", ":Pick files<CR>")
remap("n", "<leader>fh", ":Pick help<CR>")

-- oil
remap("n", "<leader>e", function()
	require("oil").toggle_float()
end)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.keymap.set("n", "<Esc>", ":q<CR>", { buffer = true, silent = true })
	end,
})

-- fterminal
remap("t", "<Esc>", [[<C-\><C-n>]])
remap("n", "<leader>1", ":Fterminal 1<CR>")
remap("n", "<leader>2", ":Fterminal 2<CR>")
remap("n", "<leader>3", ":Fterminal 3<CR>")
remap("n", "<leader>4", ":Fterminal 4<CR>")
remap("n", "<leader>5", ":Fterminal 5<CR>")

-- tabs
remap("n", "<leader><Tab>", "<cmd>tabedit .<CR>")
remap("n", "<Tab>", "gt")
remap("n", "<S-Tab>", "gT")

-- harpoon-like
remap("n", "<leader>a", function()
	vim.cmd("argadd %")
	vim.cmd("argdedup")
end)


----------------oO0 plugins 0Oo----------------

vim.pack.add({
	-- themes
	"https://github.com/vague2k/vague.nvim",
	"https://github.com/ellisonleao/gruvbox.nvim",
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
	duration_multiplier = 0.2, -- Global duration multiplier
	easing = 'sine',        -- Default easing function	
})
require "mini.pick".setup()
require "oil".setup()
require "mason".setup()
require "plenary"
require "fterminal" --mine
require "copilotchat".setup({
	model = "gpt-4.1",
})

vim.lsp.enable({ "lua_ls" })


----------------oO0 style 0Oo----------------

--vim.cmd("colorscheme vague")
vim.cmd("colorscheme gruvbox")
vim.cmd(":highlight StatusLine guibg=none ctermbg=none")
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
vim.cmd(":highlight TabLineSel gui=underline ctermbg=none")
vim.cmd(":highlight TabLine guibg=none ctermbg=none")
vim.cmd(":highlight TabLineFill guibg=none ctermbg=none")

vim.o.fillchars = "stl:─"
vim.o.statusline = "%= %m[%f] %l/%L"
