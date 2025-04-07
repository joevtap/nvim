return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        separator_style = "slant",
        numbers = "buffer_id",
      },
    })
  end,
}
