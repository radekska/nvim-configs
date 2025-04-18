return {
	"nvimtools/none-ls.nvim",
	main = "null-ls",
	dependencies = {
		{ "AstroNvim/astrolsp", opts = {} },
	},
	config = function(plugin, opts)
		local null_ls = require("null-ls")
		local sources = {
			null_ls.builtins.formatting.golines.with({
				extra_args = { "-m", "180" },
			}),
			null_ls.builtins.formatting.sqlfluff.with({
				extra_args = { "--dialect", "postgres" },
			}),
		}
		null_ls.setup({ sources = sources })
	end,
	opts = function()
		return { on_attach = require("astrolsp").on_attach }
	end,
}
