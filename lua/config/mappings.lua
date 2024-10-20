-- UH
vim.keymap.set({ "n", "v" }, "h", "j")
vim.keymap.set({ "n", "v" }, "u", "k")

-- scroll UH
vim.keymap.set({ "n", "v" }, "U", "2<C-y>2k")
vim.keymap.set({ "n", "v" }, "H", "2<C-e>2j")

-- 'L
vim.keymap.set({ "n", "v" }, "'", "h")

-- new line
vim.keymap.set({ "n", "v", "i" }, "<C-h>", "<esc>o")
vim.keymap.set({ "n", "v", "i" }, "<C-u>", "<esc>O")

vim.keymap.set("n", "<cr>", "o")

-- TODO: unmap 's'
vim.keymap.set({ "n", "v" }, "s", "<Nop>")

-- Undo/redo
vim.keymap.set({ "n", "v" }, "k", "u")
vim.keymap.set({ "n", "v" }, "K", "<C-r>")

-- ON
vim.keymap.set({ "n", "v" }, "o", "b")
vim.keymap.set({ "n", "v" }, "n", "w")

-- Save/exit
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>w<cr>")
vim.keymap.set({ "n", "v", "i" }, "<C-S-s>", "<cmd>wq<cr>")

-- Telescope
vim.keymap.set({ "n", "v" }, "\\", "<cmd>Telescope find_files<cr>")

-- Search
vim.keymap.set({ "n", "v" }, "m", "n")
vim.keymap.set({ "n", "v" }, "M", "N")

-- Format
vim.keymap.set({ "n", "v" }, "<leader>l", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)

-- Rename var
vim.keymap.set({ "n", "v" }, "<leader>q", function()
	vim.lsp.buf.rename()
end)

-- Don't yank selection on delete
vim.keymap.set("x", "<leader>p", "\"_dP")

-- delete word
vim.keymap.set({'n','v','i'}, "<C-c>", "ciw")

-- cool stuff
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
