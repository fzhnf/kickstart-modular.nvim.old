-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "BufRead",
    config = function()
      require("copilot").setup {
        panel = {
          auto_refresh = true,
        },
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
  },
  {
    "andweeb/presence.nvim",
    event = "BufRead",
    config = function()
      require("presence").setup {
        main_image = "neovim",
        neovim_image_text = "(◕ ̮ ◕)─✿❃",
        enable_line_number = false,
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
