-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      source_selector = {
        winbar = true,
        statusline = false,
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      document_symbols = {
        follow_cursor = true,
        auto_expand_level = 99,
      },
      filesystem = {
        window = {
          mappings = {
            ["l"] = "open",
          },
        },
        filtered_items = {
          hide_by_pattern = {
            "*.meta",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
    })
  end,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
    { "<leader>o", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
