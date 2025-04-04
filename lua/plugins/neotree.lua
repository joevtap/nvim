return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}},
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {},
  config = function ()
    require("neo-tree").setup({
      window = {
        position = "right",
      },
    })

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>")
    vim.keymap.set("n", "<leader>ng", ":Neotree git_status toggle<CR>")
  end
}
