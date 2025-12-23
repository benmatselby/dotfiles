return {
  name = "prolific-oss/nvim-box",
  dir = "~/git/github/prolific-oss/nvim-box/",
  opts = {
    path = "~/git/github/prolific-oss/box/",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>xb",
      function()
        require("box").pick_box_command()
      end,
      desc = "Run box action",
    },
  },
}
