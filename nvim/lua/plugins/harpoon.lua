return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    --[[
    --This is just a faster file search/tree.
    --It lets me mark a file and then jump to it.
    --Should really only be used on a select few files
    ]]
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        save_on_change = true,
        sync_on_ui_close = true,
      }
    })

    -- add current file to harpoon
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    -- harpoon quick menu
    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    -- remove current file from harpoon
    vim.keymap.set("n", "<leader>hd", function()
      harpoon:list():remove()
    end)
    -- empty the harpoon
    vim.keymap.set("n", "<leader>hD", function()
      require("harpoon"):list():clear()
    end)


    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "harpoon",
    --   callback = function()
    --     vim.keymap.set("n", "d", function()
    --       require("harpoon"):list():remove()
    --     end, { buffer = true, desc = "Remove harpoon item" })
    --   end,
    -- })

    -- <leader>1-4 jumps to 1-4 lists respectively
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-N>", function()
      harpoon:list():next()
    end)
  end,
}
