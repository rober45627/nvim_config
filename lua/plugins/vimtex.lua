return {
  "lervag/vimtex",
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"

    vim.g.vimtex_quickfix_ignore_filters = {
      "Overfull \\\\hbox",
      "Underfull \\\\hbox",
      "Overfull \\\\vbox",
      "Underfull \\\\vbox",
    }

    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-verbose",
        "-file-line-error",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
      clean_ext = "synctex.gz synctex",
    }
    vim.g.vimtex_compiler_progname = "nvr"

    vim.g.vimtex_syntax_conceal_disable = true

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function(args)
        vim.keymap.set("n", "<localleader>ld", function()
          vim.cmd("VimtexStop")
          vim.cmd("VimtexClean")
        end, {
          buffer = args.buf,
          desc = "VimTeX Stop and Clean",
        })
      end,
    })
  end,
}
