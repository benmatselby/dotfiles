-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Allow block moving up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy filename
vim.keymap.set("n", "<leader>fz", function()
  local filename = vim.fn.expand("%")
  vim.fn.setreg("+", filename)
  print("Copied filename: " .. filename)
end, { desc = "Copy relative filname" })

vim.keymap.set("n", "<leader>fZ", function()
  local filename = vim.fn.expand("%:p")
  vim.fn.setreg("+", filename)
  print("Copied filename: " .. filename)
end, { desc = "Copy full filename" })
