return {
  -- nvim-cmp  —>  Snippet Engine (Luasnip/UltiSnips)  —>  Snippets Sources
  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      { -- UltiSnip
        "quangnguyen30192/cmp-nvim-ultisnips",
        dependencies = {
          "SirVer/ultisnips",
          config = function()
            vim.g.UltiSnipsExpandTrigger = "<Tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
          end,
        },
        config = function()
          require("cmp_nvim_ultisnips").setup({})
        end,
      },

      "saadparwaiz1/cmp_luasnip",
      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      -- See `:help cmp`
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Manually trigger a completion from nvim-cmp.
          ["<C-Space>"] = cmp.mapping.complete({}),
        }),
        sources = {
          {
            name = "lazydev",
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "ultisnips" },
          { name = "path" },
          { name = "nvim_lsp_signature_help" },
        },
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
