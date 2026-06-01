vim.cmd("command Q q!")
vim.cmd("command Symbols Neotree document_symbols")
vim.cmd("command Rmd RenderMarkdown toggle")

-- When you open neovim, change current windows terminal background
local function sync_terminal_bg()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })

  if not normal.bg then
    return
  end

  local bg = string.format("#%06x", normal.bg)

  io.write(string.format("\27]11;%s\7", bg))
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = sync_terminal_bg,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = sync_terminal_bg,
})

-- When exit vim, reset windows terminal background color
local original_bg = "#282c34"

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    io.write(string.format("\27]11;%s\7", original_bg))
  end,
})

-- Search jai standard modules
vim.api.nvim_create_user_command("Jai", function(opts)
  local jai_modules = "/opt/jai/modules"
  local pattern = opts.args

  if pattern == "" then
    print("Usage: :Jai <pattern>")
    return
  end

  vim.cmd("silent grep! " .. vim.fn.shellescape(pattern) .. " " .. jai_modules)
  vim.cmd("copen")
end, {
  nargs = "+",
})
