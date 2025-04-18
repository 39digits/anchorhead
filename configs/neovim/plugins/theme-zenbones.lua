return {
  "zenbones-theme/zenbones.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
    vim.o.background = "light" -- Use "dark" for a darker variant
    vim.cmd.colorscheme("seoulbones")
		--vim.cmd.colorscheme("zenwritten")
    --vim.o.background = "dark"
    --vim.cmd.colorscheme("neobones")
    --vim.cmd.colorscheme("nordbones")
  end,
}