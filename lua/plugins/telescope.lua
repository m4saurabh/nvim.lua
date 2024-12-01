return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmds = { "Telescope" },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>" },
    { "<leader>h", "<cmd>Telescope help_tags<cr>" },
  },
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        layout_strategy = "horizontal_merged",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            height = 0.9,
            width = 0.87,
            preview_width = 0.5,
          },
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local layout_strategies = require("telescope.pickers.layout_strategies")

    layout_strategies.horizontal_merged = function(picker, max_columns, max_lines, layout_config)
      local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
      layout.prompt.title = ""
      layout.prompt.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

      layout.results.title = ""
      layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┘", "└" }
      layout.results.line = layout.results.line - 1
      layout.results.height = layout.results.height + 1

      if layout.preview then
        layout.preview.title = ""
        layout.preview.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
      end

      return layout
    end

    require("telescope").setup(opts)
  end,
}
