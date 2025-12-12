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

-- Provide keymap to close all buffers including current one
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Delete all buffers" })

-- Open daily file (YYYY/MM/YY-MM-YYYY.md)
vim.keymap.set("n", "<leader>xfdn", function()
  local date = os.date("*t")
  local year = string.format("%04d", date.year)
  local month = string.format("%02d", date.month)
  local day = string.format("%02d", date.day)

  -- Format: YYYY/MM/YY-MM-YYYY.md
  local daily_file = string.format("diary/%s/%s/%s-%s-%s.md", year, month, day, month, year)

  -- Check if file exists
  local file = io.open(daily_file, "r")
  if file then
    file:close()
    vim.cmd("edit " .. daily_file)
  else
    print("Daily file does not exist: " .. daily_file)
  end
end, { desc = "Open daily note" })
