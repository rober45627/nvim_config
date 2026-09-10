return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = function()
    local keys = {
      {
        "<leader>ja",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon: Add file",
      },
      {
        "<leader>jj",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: Toggle menu",
      },
    }

    -- quick-jump to marks 1-4 with <leader>j1 .. <leader>j4
    for i = 1, 4 do
      table.insert(keys, {
        "<leader>j" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon: Jump to " .. i,
      })
    end

    return keys
  end,
}
