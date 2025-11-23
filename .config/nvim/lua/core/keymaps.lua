-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Execute cursor line's or whole buffer's lua code
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Search Highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move focus to the [L]eft window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move focus to the [R]ight window" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Move Block
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Scroll UP / DOWN
-- vim.keymap.set("n", "<c-d>", "<c-d>zz")
-- vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("n", "<leader>mk", "`", { desc = "Goto Marks" })

-- clangd
vim.keymap.set("n", "<leader>tp", ":LspClangdSwitchSourceHeader<CR>", { desc = "C++: Switch Source <-> Header" })

-- ----------------------------------------------------------------------------: Command Mode
-- Vim command line mode navigation with up and down
vim.keymap.set("c", "<Down>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Down>"
end, { expr = true })
vim.keymap.set("c", "<Up>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<Up>"
end, { expr = true })

-- ----------------------------------------------------------------------------: Termianl Mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
