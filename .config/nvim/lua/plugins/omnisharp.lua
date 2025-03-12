return {
  "OmniSharp/omnisharp-vim",
  config = function()
    vim.g.OmniSharp_server_stdio = true
    vim.g.OmniSharp_server_use_mono = true
  end,
}
