return {
  -- Automatically install LSPs and related tools to stdpath for Neovim
  -- Mason must be loaded before its dependents so we need to set it up here.
  -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      ensure_installed = {
        "lua-language-server",
        "stylua", -- Used to format Lua code
        -- C++ & Graphics
        "clangd",
        "glsl_analyzer",
        -- Other languages
        -- "gopls", -- install go at first
        "pyright",
        "json-lsp",
        -- Utils
        "cmake-language-server",
        "bash-language-server",
        -- frontend
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "emmet-language-server",
        "tex-fmt",
      },
    },
  },
  -- Additional LSP configuration for Lua
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
