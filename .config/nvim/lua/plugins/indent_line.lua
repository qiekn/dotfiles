return {
  { -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- See `:help ibl`
    -- Commands:IBL[Disable/Enable/Toggle]
    main = "ibl",
    init = function()
      vim.api.nvim_create_user_command("IBLUpdate", function()
        -- We must have fg, otherwize, ibl will reset to LineNr
        local fg = vim.api.nvim_get_hl(0, { name = "LineNr" }).fg
        vim.api.nvim_set_hl(0, "IblScope", { fg = fg, bg = "NONE", })
        require("ibl").update({})
      end, {})
    end,
    opts = {
      indent = {
        char = "▏", -- ▏┊
      },
      scope = {
        include = {
          node_type = {
            jai = { "block", "struct_body" },
          },
        },
      },
      exclude = {
        filetypes = { "markdown" },
      },
    },
  },
}
