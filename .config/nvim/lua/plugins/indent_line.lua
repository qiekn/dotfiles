return {
  { -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- See `:help ibl`
    -- Commands:IBL[Disable/Enable/Toggle]
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
    },
  },
}
