return {
  "nvimtools/none-ls.nvim",
  main = "null-ls",
  config = function(plugin, opts)
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.formatting.golines.with {
        extra_args = { "-m", "180" },
      },
      null_ls.builtins.diagnostics.sqlfluff.with({
        extra_args = { "--dialect", "postgres" },
      }),
      null_ls.builtins.formatting.sqlfluff.with({
        extra_args = { "--dialect", "postgres" },
      }),
    }
    null_ls.setup({ sources = sources })
  end
}
