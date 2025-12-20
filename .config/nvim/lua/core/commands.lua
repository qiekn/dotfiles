vim.cmd("command Q q!")
vim.cmd("command Symbols Neotree document_symbols")
vim.cmd("command Rmd RenderMarkdown toggle")

-- Code Runner
vim.api.nvim_create_user_command("Run", function()
  local ft = vim.bo.filetype

  if ft == "javascript" then
    vim.cmd("!node %:.")
  else
    print("Not support this filetype yet.")
  end
end, {})
