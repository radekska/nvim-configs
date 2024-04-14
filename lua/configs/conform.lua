local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports", "golines" },
    markdown = { "markdownlint" },
    -- proto = { "buf" },
    tf = { "tflint", "tfsec" }
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

  formatters = {
    golines = {
      prepend_args = { "--max-len", "200" },
    },
  },
}

require("conform").setup(options)
