return {
  {
    "nvim-neotest/neotest",
    config = function()
      local Path = require("plenary.path")
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-python")({
            is_test_file = function(file_path)
              if not vim.endswith(file_path, ".py") then
                return false
              end
              local elems = vim.split(file_path, Path.path.sep)
              local file_name = elems[#elems]
              return vim.endswith(file_name, "_test.py") or vim.endswith(file_name, "_tests.py")
            end,
          }),
        },
      })
    end,
  },
}
