return {
  "qiekn/code-runner.nvim",
  keys = {
    { "<F5>", "<cmd>w<CR><cmd>Run<CR>", desc = "Run current file", silent = true },
    { "<F8>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal", silent = true },
  },
  config = function()
    require("code-runner").setup({
      use_terminal = true, -- true: split terminal, false: :! mode
      term_height = 15,

      run_scripts = {},

      cpp = {
        single_file_cmd = "clang++ -std=c++23 -stdlib=libc++ -o /tmp/{name} {file} && /tmp/{name}",
        src_dir = "src", -- source directory name
      },
      filetype_cmds = {
        -- jai = "jai -quiet {file} && ./{name}.exe",
        jai = "jai -quiet {file} >/tmp/jai.log 2>&1 && ./{name}.exe || cat /tmp/jai.log",
      },
      keymaps = {
        toggle_term = "<leader>j", -- set to false to disable
      },
    })
  end,
}
