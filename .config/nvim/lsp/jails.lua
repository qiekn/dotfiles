-- https://github.com/SogoCZE/Jails
---@type vim.lsp.Config
return {
  cmd = {
    "C:/msys64/opt/jai/jails.exe",
    "-jai_path",
    "C:/msys64/opt/jai/",
  },

  filetypes = { "jai" },

  root_markers = {
    "jails.json",
    ".jairoot",
    ".git",
  },

  single_file_support = true,
}
