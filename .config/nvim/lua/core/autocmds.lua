-- Change theme based on current buffer filetype
local themes = {
  lua = "tokyonight-night",
  jai = "naysayer",
}

local scheme = require("core.scheme")

local function update_colorscheme()
  local theme = themes[vim.bo.filetype]
  if not theme then return end

  if vim.g.colors_name ~= theme then
    -- Change colorscheme
    vim.cmd.colorscheme(theme)

    -- Some transparent settings
    scheme.reset();

    -- Fix indent_blankline
    if package.loaded["ibl"] then
      require("ibl").update({})
    end

    -- Sync terminal background
    local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    io.write(("\27]11;#%06x\27\\"):format(bg))
  end
end

-- ----------------------------------------------------------------------------: auto

vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "UIEnter" }, {
  callback = update_colorscheme,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = scheme.reset,
})
