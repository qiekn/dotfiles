return {
  -- Claude Code
  --[[
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  opts = {
    window = {
      split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
      position = "vertical", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
      enter_insert = true, -- Whether to enter insert mode when opening Claude Code
      hide_numbers = true, -- Hide line numbers in the terminal window
      hide_signcolumn = true, -- Hide the sign column in the terminal window
    },
  },
  keys = {
    { "<leader>ai", "<cmd>:ClaudeCode<CR>", desc = "AI - ClaudeCode" },
  },
  --]]

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>ai", "<cmd>ClaudeCode<cr>", desc = "AI - ClaudeCode" },
      { "<leader>cc", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      -- { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      -- { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      -- { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      -- { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      -- { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "AI - Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "AI - Deny diff" },
    },
  },
}
