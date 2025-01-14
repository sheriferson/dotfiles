local o, opt = vim.o, vim.opt

opt.autoread = true
opt.expandtab = true
opt.ignorecase = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.showmatch = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo//'
opt.backupdir = vim.fn.stdpath('config') .. '/backup//'
opt.directory = vim.fn.stdpath('config') .. '/swap//'
