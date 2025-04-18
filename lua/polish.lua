-- disable relative line numbers
vim.opt.relativenumber = false
-- enable setting for auto wrapping
vim.opt.wrap = true
-- enforce global lanugage to english
vim.opt.langmenu = "en_US.UTF-8"
vim.cmd("language en_US.UTF-8")
-- set colorscheme
vim.cmd([[colorscheme astrotheme]])
-- set filetypes
vim.cmd([[
  autocmd BufRead,BufNewFile Tiltfile set filetype=starlark
]])
vim.cmd([[
  autocmd BufRead,BufNewFile .tilt set filetype=starlark
]])
