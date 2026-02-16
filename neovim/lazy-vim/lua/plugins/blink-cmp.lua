return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
    },
    keymap = {
      preset = "default",
      -- Stop enter from picking the option. Rely on ctrl-y
      ["<CR>"] = {},
    },
  },
}
