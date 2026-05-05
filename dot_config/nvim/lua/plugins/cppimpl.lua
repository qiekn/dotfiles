return {
  {
    "qiekn/generate.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "Generate", "CppImpl" },
    keys = {
      { "<leader>ci", "<cmd>Generate implementations<cr>", desc = "Generate C++ implementations", ft = { "cpp", "c" } },
      { "<leader>ci", ":'<,'>Generate implementations<cr>", mode = "v", desc = "Generate selected implementations", ft = { "cpp", "c" } },
    },
    opts = {},
    config = function(_, opts)
      require("generate").setup(opts)
      vim.api.nvim_create_user_command("CppImpl", function(o)
        vim.cmd(o.range == 2
          and (o.line1 .. "," .. o.line2 .. "Generate implementations")
          or "Generate implementations")
      end, { range = true })
    end,
  },
}
