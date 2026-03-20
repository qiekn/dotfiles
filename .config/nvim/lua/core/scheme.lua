local C = {
  orange = "#ff9303",
}

vim.cmd("hi Normal ctermbg=none guibg=none")
vim.cmd("hi CursorLine guibg=#383f58")
-- vim.cmd("hi CursorLine guibg=red ctermbg=red ctermfg=white")
-- vim.cmd("hi CursorLineNr guibg=red ctermbg=red ctermfg=white")

vim.cmd("hi @EveryoneLoveDuck guifg=#ffa657")
vim.cmd("hi FloatBorder guifg=" .. C.orange)
vim.cmd("hi FzfLuaFzfMatch guifg=" .. C.orange)
vim.cmd("hi FzfLuaBorder guifg=" .. C.orange)

-- Fix italic in LSP hover
vim.cmd("hi @markup.raw gui=none")
vim.cmd("hi @markup.italic gui=none")

return C
