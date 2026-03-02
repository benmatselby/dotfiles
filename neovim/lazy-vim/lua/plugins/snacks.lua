return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      preset = {
        header = [[
 ██████╗ ███╗   ███╗███████╗
 ██╔══██╗████╗ ████║██╔════╝
 ██████╔╝██╔████╔██║███████╗
 ██╔══██╗██║╚██╔╝██║╚════██║
 ██████╔╝██║ ╚═╝ ██║███████║
 ╚═════╝ ╚═╝     ╚═╝╚══════╝
Never give up, never surrender!!
        ]],
      },
    },
    gh = { enabled = true },
    explorer = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true, -- show dotfiles in fuzzy finder
          ignored = true, -- optional: show gitignored files
        },
      },
    },
  },
  keys = {
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },
  },
}
