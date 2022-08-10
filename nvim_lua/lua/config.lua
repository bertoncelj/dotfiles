-- encoding utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- jkhl minimal character off sreen to keep you on
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- numbers and relativenumber on
vim.wo.number = true
vim.wo.relativenumber = true

-- shift
vim.wo.signcolumn = "yes"
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- tab with commands < >
vim.o.expandtab = true
vim.bo.expandtab = true

-- copy indent from current line to next 
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- igonre care in a pattern  
vim.o.ignorecase = true
vim.o.smartcase = true

-- higlght all matches
vim.o.hlsearch = true
vim.o.incsearch = true

-- refresh file in change outside 
vim.o.autoread = true
vim.bo.autoread = true

-- text go to new line if screen is shorter
vim.wo.wrap = false
-- where is made cut to new line 
vim.o.whichwrap = "<,>,[,]"

-- enable mouse 
vim.o.mouse = "a"

-- disable file tracking
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 300
vim.o.timeoutlen = 500

-- split window 
vim.o.splitbelow = true
vim.o.splitright = true

-- gui colors
vim.o.termguicolors = true
vim.opt.termguicolors = true
