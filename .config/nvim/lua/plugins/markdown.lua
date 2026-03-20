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
      overrides = {
        buftype = {
          -- LSP hover floating windows
          nofile = {
            heading = {
              icons = { "", "", "", "", "", "" },
              position = "inline",
              sign = false,
              width = "full",
              left_pad = 0,
              left_margin = 0,
              border = false,
              backgrounds = {
                "RenderMarkdownHoverH1",
                "RenderMarkdownHoverH2",
                "RenderMarkdownHoverH3",
                "RenderMarkdownHoverH4",
                "RenderMarkdownHoverH5",
                "RenderMarkdownHoverH6",
              },
            },
            code = {
              inline = false,
            },
          },
        },
      },
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
