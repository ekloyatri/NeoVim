-- lvim.opt[ocal] options = {

local opt = vim.opt

opt.mousemoveevent = true
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 2 -- so that `` is visible in markdown files
opt.concealcursor = "" -- conceal only on normal and command mode
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- opt.showtabline = 0 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 350 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = true -- display lines as one long line
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.title = true
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.wildmenu = true

opt.path:append("**")
opt.shortmess:append("c")

opt.fillchars = {
	eob = " ",
	vertleft = " ",
	vertright = " ",
	stl = " ",
}

opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")
opt.formatoptions:remove("cro")

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

vim.loader.enable()

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
