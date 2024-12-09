local map = vim.keymap.set

-- UH
map({ "n", "v" }, "h", "j")
map({ "n", "v" }, "u", "k")

-- scroll UH
map({ "n", "v" }, "U", "3<C-y>3k")
map({ "n", "v" }, "H", "3<C-e>3j")

-- ;L
map({ "n", "v" }, ";", "h")
map({ "n", "v" }, "l", "l")

-- new line
map({ "n", "v", "i" }, "<C-h>", "<esc>o")
map({ "n", "v", "i" }, "<C-u>", "<esc>O")

map("n", "<cr>", "o")

-- TODO: unmap 's'
map({ "n", "v" }, "s", "<Nop>")

-- Undo/redo
map({ "n", "v" }, "k", "u")
map({ "n", "v" }, "K", "<C-r>")

-- ON
map({ "n", "v" }, "o", "b")
map({ "n", "v" }, "n", "w")

-- Save/exit
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<cr>")
map({ "n", "v", "i" }, "<C-S-s>", "<cmd>wq<cr>")

-- Telescope
map({ "n", "v" }, "\\", "<cmd>Telescope find_files find_command=fd<cr>")
map({ "n", "v" }, "<leader>wd", "<cmd>Telescope diagnostics theme=ivy<cr>")

-- Search
map({ "n", "v" }, "m", "n")
map({ "n", "v" }, "M", "N")

-- Buffer
map({ "n", "v" }, "<leader>e", "<cmd>BufferLineCyclePrev<cr>")
map({ "n", "v" }, "<leader>t", "<cmd>BufferLineCycleNext<cr>")
map({ "n", "v", "i" }, "<C-x>", "<cmd>BufferLinePickClose<cr>")

-- Jump
map({ "n", "v" }, "<leader>d", "<cmd>Telescope lsp_definitions<cr>")
map({ "n", "v" }, "<leader>D", "<cmd>Telescope lsp_incoming_calls<cr>")
map({ "n", "v" }, "<leader>g", "<cmd>Telescope live_grep<cr>")
map({ "n", "v" }, "<leader>rs", "<cmd>Gitsigns stage_hunk<cr>")
map({ "n", "v" }, "<leader>rS", "<cmd>Gitsigns reset_hunk<cr>")
map({ "n", "v" }, "<leader>n", "<cmd>Navbuddy<cr>")

-- terminal
map({ "n", "v" }, "<leader>T", "<cmd>Lspsaga term_toggle<cr>")

-- Format
map({ "n", "v" }, "<leader>l", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)

-- Rename var
map({ "n", "v" }, "<leader>q", function()
	vim.lsp.buf.rename()
end)

-- Don't yank selection on delete
map("x", "<leader>p", '"_dP')

-- delete word
map({ "n", "v", "i" }, "<C-c>", "<esc>ciw")

-- cool stuff
map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>fmg", "<cmd>CellularAutomaton game_of_life<CR>")
map("n", "<leader>fms", "<cmd>CellularAutomaton scramble<CR>")
map("n", "<leader>fmt", "<cmd>Tetris<CR>")
