vim.cmd("command Q q!")
vim.cmd("command Symbols Neotree document_symbols")
vim.cmd("command Rmd RenderMarkdown toggle")

-- Code Runner
vim.api.nvim_create_user_command("Run", function()
  local ft = vim.bo.filetype

  if ft == "javascript" then
    vim.cmd("!node %:.")
  elseif ft == "cpp" then
    local exe_name = vim.fn.expand("%:t:r")
    local root = vim.fs.root(0, "CMakeLists.txt")
    local build_dir = root .. "/build"
    local exe_path = build_dir .. "/" .. exe_name

    vim.cmd("!" .. "cmake --build " .. build_dir .. " --target " .. exe_name .. " -j && " .. exe_path)
  else
    print("Not support this filetype yet.")
  end
end, {})
