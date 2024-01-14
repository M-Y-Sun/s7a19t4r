local opt=vim.opt 

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.guicursor = "n-v-c-i:block"
opt.termguicolors = true
