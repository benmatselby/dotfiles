-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Give me the hash symbol
vim.api.nvim_set_keymap("i", "<M-3>", "#", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-3>", "#", { noremap = true, silent = true })

-- Trim trailing whitespace on save
vim.cmd([[
  augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]])
