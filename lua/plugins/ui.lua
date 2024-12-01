return {
  {
    "echasnovski/mini.statusline",
    event = "VeryLazy",
    config = true,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "echasnovski/mini.icons",
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
