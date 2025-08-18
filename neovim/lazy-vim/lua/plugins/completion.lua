return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- This is only here because of this bug
      -- https://github.com/LazyVim/LazyVim/issues/6185
      preset = "super-tab",
      ["<Tab>"] = {
        require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
        require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
        "fallback",
      },
    },
  },
}
