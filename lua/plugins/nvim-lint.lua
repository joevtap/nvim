return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
    }

    vim.g.lint_enabled = true

    vim.api.nvim_create_user_command("ToggleLint", function()
      vim.g.lint_enabled = not vim.g.lint_enabled
      if vim.g.lint_enabled then
        print("Global linting enabled")
        lint.try_lint()
      else
        print("Global linting disabled")
        -- Clear any remaining diagnostics when globally disabling linting
        vim.diagnostic.reset(lint.namespace, 0)
      end
    end, {})

    -- New command to toggle linting for the current buffer for all linters.
    vim.api.nvim_create_user_command("ToggleBufferLint", function()
      vim.b.disable_all_linters = not vim.b.disable_all_linters
      local state = vim.b.disable_all_linters and "disabled" or "enabled"
      print("Buffer linting is " .. state .. ".")
      -- When disabling linting for the buffer, clear diagnostics
      if vim.b.disable_all_linters then
        vim.diagnostic.reset(lint.namespace, 0)
      else
        lint.try_lint()
      end
    end, {})

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        if vim.g.lint_enabled then
          local ft = vim.bo.filetype
          local configured_linters = lint.linters_by_ft[ft]
          if configured_linters then
            if vim.b.disable_all_linters then
              -- Clear diagnostics if linting is disabled for this buffer.
              vim.diagnostic.reset(lint.namespace, 0)
            else
              lint.try_lint()
            end
          end
        end
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
