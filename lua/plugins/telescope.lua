return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope [f]ind [f]iles" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live [f]ind [g]rep" })
      vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Open telescope [b]uffers", silent = true })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
}
