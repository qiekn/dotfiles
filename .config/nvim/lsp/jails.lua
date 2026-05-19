-- https://github.com/SogoCZE/Jails
---@type vim.lsp.Config
return {
  cmd = {
    "E:/apps/jai/bin/jails.exe",
  },

  filetypes = { "jai" },

  root_markers = {
    "jails.json",
    ".jairoot",
    ".git",
  },

  single_file_support = true,
}
