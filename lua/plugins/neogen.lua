return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      enabled = true,
      input_after_comment = true, -- Automatically jump to insert mode after generating a comment
    })
  end,
}
