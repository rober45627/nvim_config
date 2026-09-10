return {
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.tex",
        callback = function()
          local template = vim.fn.expand("C:/Users/robro/Vault/LaTeX/template/preamble.tex")
          if vim.fn.filereadable(template) == 1 then
            vim.cmd("0r " .. template)
            vim.cmd("normal! gg")

            -- force re-detection now that real LaTeX content exists,
            -- otherwise it can get stuck as 'plaintex' (detected on the
            -- empty buffer before insertion) and highlighting looks off
            -- until the file is reopened
            vim.bo.filetype = "tex"

            -- find the word "Title" (case-sensitive) and place cursor at its end, in insert mode
            local pos = vim.fn.search([[\CTitle]], "W")
            if pos > 0 then
              vim.cmd("normal! ea")
            end
          end
        end,
      })
    end,
  },
}
