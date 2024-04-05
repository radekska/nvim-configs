require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>gg", "<cmd>:LazyGit<cr>", {desc = "Lazy git"})
map("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>", {desc = "Select project"})
map("n", "<leader>ln", ":lua require('nvim-navbuddy').open()<CR>", {desc = "LSP Navigation"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
