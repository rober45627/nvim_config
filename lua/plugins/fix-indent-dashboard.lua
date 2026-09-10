return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      filter = function(buf)
        return vim.g.snacks_indent ~= false and vim.bo[buf].buftype == "" and vim.bo[buf].filetype ~= "dashboard"
      end,
    },
  },
}
