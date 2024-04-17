return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<C-n>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>x"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
          ["<Tab>"] = {
            function() require("astrocore.buffer").nav(vim.v.count1) end,
            desc = "Next buffer",
          },
          ["<Leader>ln"] = { ":lua require('nvim-navbuddy').open()<CR>", desc = "LSP Navigation" },
          ["<Leader>fp"] = {
            ":lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
            desc = "Select project",
          },
        },
        t = {
          ["<C-k>"] = false,
        }
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
