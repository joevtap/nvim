-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Working if buffers
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Move to the [p]revious [b]uffer", silent = true })
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Move to the [n]ext [b]uffer", silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "[d]elete the current [b]uffer", silent = true })
vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>", { desc = "Open [t]elescope [b]uffers", silent = true })

-- Exec lua
vim.keymap.set("v", "<leader>x", ":lua<CR>")
