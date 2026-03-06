return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      local Path = require("plenary.path")
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-golang"))
      table.insert(opts.adapters, require("neotest-vitest"))
      table.insert(
        opts.adapters,
        require("neotest-python")({
          is_test_file = function(file_path)
            if not vim.endswith(file_path, ".py") then
              return false
            end
            local elems = vim.split(file_path, Path.path.sep)
            local file_name = elems[#elems]
            return vim.endswith(file_name, "_test.py")
              or vim.endswith(file_name, "_tests.py")
              or vim.startswith(file_name, "test_")
              or vim.startswith(file_name, "tests_")
          end,
        })
      )
    end,
  },
}
