-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

vim.o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50"
