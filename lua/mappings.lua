require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "gt", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<leader>bp", ":BufferLinePick<CR>", { noremap = true, silent = true })
map("n", "<tab>", "gt", { noremap = true, silent = true })
map({ "n", "t" }, "<C-j>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
