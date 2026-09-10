return {
  {
    "LazyVim/LazyVim",
    opts = function()
      local folder_strings = {
        ["001"] = "Other",
        --["101"] = "Linear Algebra",
        --["102"] = "Mechanics",
        --["111"] = "Single Variable Calculus",
        --["112"] = "Introduction to Programming",
        --["113"] = "Introduction to Probability",
        --["121"] = "Analysis on the Real Line",
        --["122"] = "Advanced Calculus",
        --["123"] = "Introduction to Computation Theory and Logic",
        --["124"] = "Introduction to Statistics",
        ["201"] = "Advanced Analysis",
        ["202"] = "Managment Science Methods",
        ["211"] = "Analysis in Several Real Variables",
        ["212"] = "Group Theory",
        ["213"] = "Ordinary Differential Equations",
        ["214"] = "Applied Probability I",
        -- add more mappings as needed
      }
      local subfolder_strings = {
        ["01"] = "Notes",
        ["02"] = "Work",
        ["03"] = "Other",
        ["04"] = "Questions",
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function(args)
          vim.keymap.set("n", "<localleader>lm", function()
            local pdf_src = vim.fn.expand("%:p:r") .. ".pdf"
            if vim.fn.filereadable(pdf_src) == 0 then
              vim.notify("No PDF found - compile first with \\ll", vim.log.levels.WARN)
              return
            end
            local basename = vim.fn.expand("%:t:r") -- filename without extension
            local course_code, sub_code = basename:match("^(%d+)-(%d+)-")
            if not course_code or not sub_code then
              vim.notify("Filename doesn't match 'CODE-SUB-name.tex' pattern: " .. basename, vim.log.levels.ERROR)
              return
            end
            local course_name = folder_strings[course_code]
            local sub_name = subfolder_strings[sub_code]
            if not course_name then
              vim.notify("Unknown course code: " .. course_code, vim.log.levels.ERROR)
              return
            end
            if not sub_name then
              vim.notify("Unknown subfolder code: " .. sub_code, vim.log.levels.ERROR)
              return
            end
            -- fixed absolute destination root (forward slashes work fine on Windows,
            -- and avoid Lua's backslash-escape problems, e.g. "\r" being read as CR)
            local dest_dir = "C:/Users/robro/Vault/Maths/" .. course_name .. "/" .. sub_name

            vim.ui.input({ prompt = "Save as: ", completion = "file" }, function(new_name)
              if not new_name or new_name == "" then
                vim.notify("Cancelled", vim.log.levels.WARN)
                return
              end

              vim.fn.mkdir(dest_dir, "p") -- create nested folders if they don't exist
              local dest = dest_dir .. "/" .. new_name .. ".pdf"
              local ok = vim.uv.fs_copyfile(pdf_src, dest)
              if ok then
                vim.notify("Copied to " .. vim.fn.fnamemodify(dest, ":~"))
              else
                vim.notify("Failed to copy PDF", vim.log.levels.ERROR)
              end
            end)
          end, { buffer = args.buf, desc = "Copy-PDF-to-/Maths)" })
        end,
      })
    end,
  },
}
