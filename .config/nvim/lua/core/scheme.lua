local C = {
  orange = "#ff9303",
}

local function apply_custom_highlight()
  -- Transparent background
  vim.cmd("hi NormalFloat guibg=NONE")
  vim.cmd("hi SignColumn  guibg=NONE")
  vim.cmd("hi Folded      guibg=NONE")

  -- Custom colors
  vim.cmd("hi @EveryoneLoveDuck guifg=#ffa657")
  vim.cmd("hi FloatBorder    guifg=" .. C.orange .. " guibg=NONE")
  vim.cmd("hi FzfLuaFzfMatch guifg=" .. C.orange)
  vim.cmd("hi FzfLuaBorder   guifg=" .. C.orange)

  -- vim.cmd("hi CursorLine guibg=#383f58")
  -- vim.cmd("hi CursorLine guibg=red ctermbg=red ctermfg=white")
  -- vim.cmd("hi CursorLineNr guibg=red ctermbg=red ctermfg=white")

  -- Fix italic in LSP hover
  vim.cmd("hi @markup.italic gui=NONE")

  -- Fix indent_blankline
  vim.cmd("IBLUpdate")
end

-- RETURN
C.reset = apply_custom_highlight

return C
