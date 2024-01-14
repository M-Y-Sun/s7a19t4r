vim.g.mapleader=" "

local keymap = vim.keymap

--easy navigation in insert mode
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")

--insert new line without leaving normal mode
keymap.set("n", "<leader>o", "o<Esc>")
keymap.set("n", "<leader>O", "O<Esc>")
keymap.set("n", "<leader>x", "i <Esc>")

--handling and moving between tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

--toggling nvim tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

--dap debugger
keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<F6>", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "<F7>", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "<F8>", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<S-F9>", ":lua require'dap'.toggle_breakpoint(vim.fn.input('breakpoint condition: '))<CR>")
keymap.set("n", "C-<F9>", ":lua require'dap'.toggle_breakpoint(vim.fn.input('log point message: '))<CR>")
keymap.set("n", "<S-F5>", ":lua require'dap'.terminate()<CR>")

keymap.set("n", "<leader>c1", ":colorscheme tokyonight-night<CR>") --changing colorscheme to tokyo-night
keymap.set("n", "<leader>c2", ":colorscheme default<CR>") --changing to default colorscheme for plain text documents
keymap.set("n", "<leader>c3", ":colorscheme monokai_ristretto<CR>")
