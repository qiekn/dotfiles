return {
  "qiekn/code-runner.nvim",
  config = function()
    require("code-runner").setup({
      use_terminal = true, -- true: split terminal, false: :! mode
      term_height = 15,
      cpp = {
        single_file_cmd = "clang++ -std=c++23 -stdlib=libc++ -o /tmp/{name} {file} && /tmp/{name}",
        src_dir = "src", -- source directory name
      },
      -- filetype_cmds = {},
      keymaps = {
        toggle_term = "<leader>j", -- set to false to disable
      },
    })
  end,
}
