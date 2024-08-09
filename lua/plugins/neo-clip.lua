return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    -- you'll need at least one of these
    -- {'nvim-telescope/telescope.nvim'},
    -- {'ibhagwan/fzf-lua'},
    { "kkharji/sqlite.lua", module = "sqlite" },
  },
  config = function()
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = true,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      continuous_sync = false, -- Optional: sync continuously
      filter = nil, -- Optional: filter function
      preview = true, -- Enable preview
      default_register = '"',
    })
  end,
}
