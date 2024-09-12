return {
  "nvimtools/none-ls.nvim",
  main = "null-ls",
  config = function(plugin, opts)
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.formatting.golines.with {
        extra_args = { "-m", "180" },
      }
    }
    null_ls.setup({ sources = sources, debug = true })
  end
}
