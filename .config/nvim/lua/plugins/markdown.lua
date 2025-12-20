return {
  { "preservim/vim-markdown" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      default = false,
      code = {
        width = "block",
        min_width = 80,
        border = "thin",
        left_pad = 1,
        right_pad = 1,
        language_icon = true,
        language_name = true,
      },
      anti_conceal = {
        disable_mode = { "n" },
        ignore = {
          head_border = true,
          head_background = true,
        },
      },
    },
  },
}
