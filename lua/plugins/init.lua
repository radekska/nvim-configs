return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {

      sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "python",
        "go",
        "markdown",
        "yaml",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension "project"
    end,
  },

  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  --   config = function()
  --     require("venv-selector").setup { name = { "venv", ".venv" }, auto_refresh = true }
  --   end,
  --   event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  -- },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {

    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("gitlinker").setup {
        opts = {
          -- remote = 'github', -- force the use of a specific remote
          -- adds current line nr in the url for normal mode
          add_current_line_on_normal_mode = true,
          -- callback for what to do with the url/
          action_callback = require("gitlinker.actions").open_in_browser,
          -- print the url after performing the action
          print_url = false,
          -- mapping to call url generation
          mappings = "<leader>gy",
        },
      }
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "Pocco81/auto-save.nvim",
    event = "BufRead",
  },
  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",         -- Optional
      "nvim-telescope/telescope.nvim", -- Optional
    },
    config = function()
      require("nvim-navbuddy").setup { window = { size = "90%" }, lsp = { auto_attach = true } }
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {}
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        },
      }
    end,
  },
  {

    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        execution_message = {
          message = function() -- message to print on save
            return ("AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S")
          end,
          dim = 0.18,               -- dim the color of `message`
          cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
      }
    end,
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup {
        -- Your configuration goes here.
      }
    end,
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    event = "BufRead",
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "python-rope/ropevim",
    event = "BufRead",
    build = "pip install ropevim",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    event = "BufRead",

    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup({
        animation = {
          fps = 60
        }
      })
    end
  }
}
