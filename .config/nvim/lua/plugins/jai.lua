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

      -- No reason
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "jai",
        callback = function()
          vim.api.nvim_set_hl(0, "SpecialHates", { fg = "#ffffff", bg = "#ff0000", bold = true })
          vim.fn.matchadd("SpecialHates", "fuckyoujonathanblow", 200)
        end,
      })
    end,
  },
}
