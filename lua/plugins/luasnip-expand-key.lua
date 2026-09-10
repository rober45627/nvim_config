return {
  "L3MON4D3/LuaSnip",
  keys = {
    {
      "<C-l>",
      function()
        local ls = require("luasnip")
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      mode = { "i", "s" },
      desc = "LuaSnip: Expand or jump",
    },
  },
}
