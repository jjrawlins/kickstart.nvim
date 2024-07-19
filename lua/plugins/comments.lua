return {
  "terrortylor/nvim-comment",
  init = function()
    require("nvim_comment").setup({
      comment_empty = false,
      line_mapping = "<leader>Ccl",
      operator_mapping = "<leader>Cco",
      comment_chunk_text_object = "ic",
    })
  end,
}
