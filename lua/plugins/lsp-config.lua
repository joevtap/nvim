return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "gopls", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.pyright.setup({})

      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true })
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, { silent = true })
      vim.keymap.set({ "n", "i" }, "<C-Space>", "<C-x><C-o>", { silent = true })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { silent = true })
    end,
  },
}
