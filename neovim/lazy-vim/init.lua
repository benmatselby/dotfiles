-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Give me the has symbol
vim.api.nvim_set_keymap("i", "<M-3>", "#", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-3>", "#", { noremap = true, silent = true })

-- Provide some rulers, can this go somewhere better?
--vim.api.nvim_set_option_value("colorcolumn", "80,100,120", {})
