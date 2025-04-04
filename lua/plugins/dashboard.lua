return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "      ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "      ██║██╔═══██╗██║   ██║██║████╗ ████║ ",
      "      ██║██║   ██║██║   ██║██║██╔████╔██║ ",
      " ██   ██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ╚█████╔╝╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚════╝  ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    }

    dashboard.section.header.opts = {
      position = "center",
    }

    local header_lines = #dashboard.section.header.val
    local button_lines = #dashboard.section.buttons.val
    -- Adjust the extra padding (here 2 for extra space) if needed
    local total_content = header_lines + button_lines + 2
    local win_height = vim.fn.winheight(0)
    local top_padding = math.floor((win_height - total_content) / 2)

    dashboard.config.layout = {
      { type = "padding", val = top_padding },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", ":ene<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", ":Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", ":Telescope live_grep<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
