vim.cmd("hi Normal ctermbg=none guibg=none")
vim.cmd("hi CursorLine guibg=#383f58")
-- vim.cmd("hi CursorLine guibg=red ctermbg=red ctermfg=white")
-- vim.cmd("hi CursorLineNr guibg=red ctermbg=red ctermfg=white")

vim.cmd("hi @EveryoneLoveDuck guifg=#ffa657")
vim.cmd("hi FloatBorder guifg=#ff9303")

-- Fix italic in LSP hover
vim.cmd("hi @markup.raw gui=none")
vim.cmd("hi @markup.italic gui=none")
