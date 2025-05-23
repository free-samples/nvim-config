return {
  "folke/snacks.nvim",
  opts = {
    -- other snacks options...
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    -- Auto-open explorer on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          require("snacks").explorer()
        end
      end,
    })
  end,
}
