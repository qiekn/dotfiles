local C = {
  orange = "#ff9303",
}

-- vim.cmd("hi Normal ctermbg=none guibg=none")
-- vim.cmd("hi CursorLine guibg=#383f58")
-- vim.cmd("hi CursorLine guibg=red ctermbg=red ctermfg=white")
-- vim.cmd("hi CursorLineNr guibg=red ctermbg=red ctermfg=white")

vim.cmd("hi @EveryoneLoveDuck guifg=#ffa657")
vim.cmd("hi FloatBorder guifg=" .. C.orange .. " guibg=none")
vim.cmd("hi FzfLuaFzfMatch guifg=" .. C.orange)
vim.cmd("hi FzfLuaBorder guifg=" .. C.orange)

-- StatusLine
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { link = "StatusLine" })

-- Fix italic in LSP hover
-- vim.cmd("hi @markup.raw gui=none")
vim.cmd("hi @markup.italic gui=none")

return C
