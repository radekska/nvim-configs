-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
-- turn of relative lines
vim.opt.relativenumber = false
-- enforce global lanugage to english
vim.opt.langmenu = "en_US.UTF-8"
vim.cmd "language en_US.UTF-8"
-- wrap lines
vim.opt.wrap = true
vim.cmd [[colorscheme astrotheme]]

vim.cmd [[
  autocmd BufRead,BufNewFile Tiltfile set filetype=starlark
]]

vim.cmd [[
  autocmd BufRead,BufNewFile .tilt set filetype=starlark
]]

-- Fix arrow key sequences in terminal mode
vim.api.nvim_set_keymap('i', '^[[1;4D', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Esc>[1;4C', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Esc>[1;4A', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Esc>[1;4B', '<Down>', { noremap = true, silent = true })


vim.env.TERM = "xterm-256color"
vim.env.DEBUG_CODEIUM = "fatal"

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

require("notify").setup({
  background_colour = "#000000",
})
