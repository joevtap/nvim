return {
  "rebelot/kanagawa.nvim",
  config = function()
    local kanagawa = require("kanagawa")

    kanagawa.setup({})

    kanagawa.load("dragon")
  end,
}
