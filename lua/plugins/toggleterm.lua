return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({})

    vim.keymap.set("n", "<leader><Esc>", ":ToggleTerm direction=horizontal size=10<CR>", { silent = true })
    vim.keymap.set("v", "<leader>t", ":ToggleTermSendVisualSelection<CR>", { silent = true })
  end,
}
