return {
  -- LuaSnip itself, plus the Gilles Castel snippet port
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rober45627/luasnip-latex-snippets.nvim",
        dependencies = { "lervag/vimtex" },
        ft = { "tex", "plaintex" },
        config = function()
          -- use_treesitter = false -> relies on vimtex to detect math mode,
          -- which is what you already have set up
          require("luasnip-latex-snippets").setup({ use_treesitter = false })
        end,
      },
    },
    opts = {
      -- required for Castel-style auto-expanding snippets (e.g. "->" becoming \to)
      enable_autosnippets = true,
    },
  },

  -- Wire LuaSnip into blink.cmp as a snippet source
  {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      snippets = { preset = "luasnip" },
    },
  },
}
