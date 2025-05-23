return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = vim.opt.sessionoptions:get(), -- sessionoptions used for saving
    pre_save = nil, -- a function to call before saving the session
    save_empty = false, -- don't save if there are no open file buffers
  },
  -- Auto-restore session when starting nvim
  init = function()
    if vim.fn.argc() == 0 then
      -- require("snacks").explorer()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          require("persistence").load()
        end,
        nested = true,
      })
    end
  end,
}
