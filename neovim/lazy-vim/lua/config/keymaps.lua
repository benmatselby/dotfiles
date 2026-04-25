-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete and paste
vim.keymap.set("x", "p", [["_dP]])

-- Word shifting
vim.keymap.set("i", "<A-l>", "<C-o>w") -- Alt+L to jump word right
vim.keymap.set("i", "<A-h>", "<C-o>b") -- Alt+H to jump word left

-- Window resizing
vim.keymap.set("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Allow block moving up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Give me the hash symbol
vim.keymap.set("i", "<M-3>", "#", { noremap = true, silent = true })
vim.keymap.set("n", "<M-3>", "#", { noremap = true, silent = true })
vim.keymap.set("c", "<M-3>", "#", { noremap = true, silent = true })

-- Copy filename
vim.keymap.set("n", "<leader>fz", function()
  local filename = vim.fn.expand("%")
  vim.fn.setreg("+", filename)
  print("Copied filename: " .. filename)
end, { desc = "Copy relative filename" })

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
    print("Looking for generate-eod.sh script in the repo...")
    local script_path = vim.fn.system("fd --type f 'generate-eod.sh' --max-results 1"):gsub("%s+$", "")
    if script_path ~= "" then
      print("Found generate-eod.sh script: " .. script_path)
      -- Call the script to generate the daily file.
      vim.fn.system(script_path)
      vim.cmd("edit " .. daily_file)
    else
      print("No generate-eod.sh script found in the repo.")
    end
  end
end, { desc = "Open daily note" })

-- Show changed files on branch vs origin
vim.keymap.set("n", "<leader>gE", function()
  Snacks.picker.pick({
    finder = function(opts, ctx)
      local cwd = ctx:git_root()
      ctx.picker:set_cwd(cwd)
      return require("snacks.picker.source.proc").proc(
        ctx:opts({
          cmd = "git",
          args = { "diff", "--name-only", "origin/HEAD" },
          cwd = cwd,
          transform = function(item)
            if item.text == "" then
              return false
            end
            item.file = item.text
            item.cwd = cwd
          end,
        }),
        ctx
      )
    end,
    format = "file",
    preview = "file",
  })
end, { desc = "Git Diff branch files" })
