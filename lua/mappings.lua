require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>gg", "<cmd>:LazyGit<cr>", { desc = "Lazy git" })
map("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
  { desc = "Select project" })
map("n", "<leader>ln", ":lua require('nvim-navbuddy').open()<CR>", { desc = "LSP Navigation" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- windows resize
map("n", "+", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
map("n", "_", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
map("n", "=", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
map("n", "-", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true, timeout_ms = 5000 }
end, { desc = "Format Files" })
