return {
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "telescope.nvim" },
    config = function() require("telescope").load_extension "project" end,
  },
}
