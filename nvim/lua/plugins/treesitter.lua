local langs = {
  "c", "cpp", "lua", "python", "rust"
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install(langs);


    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        local buf = args.buf;
        local ft = vim.bo[buf].filetype;

        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
          return
        end;

        local ok_add = pcall(vim.treesitter.language.add, lang);
        if not ok_add then
          return
        end;

        pcall(vim.treesitter.start, buf, lang);
      end,
    })
  end,
}



