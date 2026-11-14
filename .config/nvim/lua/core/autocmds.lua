-- Change theme based on current buffer filetype
local themes = {
  lua = "tokyonight",
  jai = "naysayer",
}

local function update_colorscheme()
  local theme = themes[vim.bo.filetype]

  if not theme then return end

  if vim.g.colors_name ~= theme then
    vim.cmd.colorscheme(theme)

    -- Sync terminal background
    local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    io.write(("\27]11;#%06x\27\\"):format(bg))
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "UIEnter" }, {
  callback = update_colorscheme,
})
