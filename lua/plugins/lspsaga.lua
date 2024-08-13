return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        code_action = "",
      },
      definition = {
        keys = {
          quit = "<C-Esc>", -- Add this line to set Control+Escape as the quit key
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
