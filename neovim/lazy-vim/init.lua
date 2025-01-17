-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Give me the hash symbol
vim.api.nvim_set_keymap("i", "<M-3>", "#", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-3>", "#", { noremap = true, silent = true })

-- Provide some rulers, can this go somewhere better?
vim.api.nvim_set_option_value("colorcolumn", "80,100,120", {})

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Number of spaces to use for each step of (auto)indent
vim.o.shiftwidth = 2

-- Number of spaces that a <Tab> in the file counts for
vim.o.tabstop = 2

-- Number of spaces that a <Tab> counts for while performing editing operations
vim.o.softtabstop = 2

-- Ensure these settings are applied to all file types
vim.cmd [[
  autocmd BufRead,BufNewFile * setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
]]
