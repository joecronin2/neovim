-- set system clipboard default
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.wrap = false
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.wo.relativenumber = true
-- tab length
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 15
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim_undo"
vim.opt.undofile = true

vim.opt.termguicolors = true
-- python
vim.g.python3_host_prog = "/opt/venvs/main/bin/python3"
-- setup keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.mappings")
require("config.lazy")
--require("everforest").load()
vim.cmd([[colorscheme everforest]])



