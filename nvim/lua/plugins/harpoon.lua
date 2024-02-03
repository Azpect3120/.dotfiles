return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function() require("harpoon"):setup() end,
  keys = {
    { "<leader>a", function() require("harpoon"):list():append() end, desc = "Add File to Harpoon" },
    { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Quick Menu" },
    { "<leader>c", function() require("harpoon"):list():clear() end, desc = "Clear Harpoon Menu" },
    { "<leader>r", function() require("harpoon"):list():remove() end, desc = "Remove File from Harpoon" },
    { "<leader>.", function() require("harpoon"):list():next() end, desc = "Harpoon to Next File" },
    { "<leader>,", function() require("harpoon"):list():prev() end, desc = "Harpoon to Previous File" },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon to File 1" },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon to File 2" },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon to File 3" },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon to File 4" },
    { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon to File 5" },
  },
}
