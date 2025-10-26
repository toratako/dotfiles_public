-- Thanks: https://www.reddit.com/r/neovim/comments/12tc2rx/

return {
  {
    "folke/tokyonight.nvim",

    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
