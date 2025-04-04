return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {},
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
      },
    })

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", { silent = true })
    vim.keymap.set("n", "<leader>ng", ":Neotree git_status toggle<CR>", { silent = true })
  end,
}
