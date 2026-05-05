return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"

    vim.g.vimtex_quickfix_mode = 0
  end,

  dependencies = {
    "KeitaNakamura/tex-conceal.vim",
    init = function()
      vim.opt.conceallevel = 2
      vim.g.tex_conceal = "abdmg"

      -- Conceal Highlights
      vim.api.nvim_set_hl(0, "TexConcealWhite", { fg = "#FFFFFF", bg = "NONE", bold = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.wo.winhighlight = "Conceal:TexConcealWhite"
        end,
      })
    end,
  },
}
