return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-t>]], -- Ctrl+t toggles the terminal
    insert_mappings = false, -- don't also trigger from insert mode (was firing while typing prose)
    direction = "float", -- or "horizontal" / "vertical"
    shell = "cmd", -- change to "cmd" if you'd rather use Command Prompt
  },
}
