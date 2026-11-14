return {
  {
    "rluba/jai.vim", -- syntax highlighting for jai
    ft = "jai",

    init = function()
      vim.filetype.add({
        extension = {
          jai = "jai",
          bla = "jai",
          blow = "jai",
          enjoyer = "jai",
          ["%"] = "jai",
        },
      })
    end,
  },
}
