-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_keymap("i", "<M-3>", "#", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-3>", "#", { noremap = true, silent = true })
