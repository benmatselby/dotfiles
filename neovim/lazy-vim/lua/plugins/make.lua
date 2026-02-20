return {
  "benmatselby/nvim-make",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "NvimMake",
  opts = {},
  keys = {
    {
      "<leader>xm",
      function()
        require("nvim_make").pick_make_target()
      end,
      desc = "Run make target",
    },
  },
}
