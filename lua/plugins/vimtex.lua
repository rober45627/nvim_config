return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_syntax_conceal_disable = true
    vim.g.vimtex_quickfix_ignore_filters = {
      "Overfull \\\\hbox",
      "Underfull \\\\hbox",
      "Overfull \\\\vbox",
      "Underfull \\\\vbox",
    }
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=0",
      },
    }
  end,
}
