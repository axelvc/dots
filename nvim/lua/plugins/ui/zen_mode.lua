require('zen-mode').setup {
  window = {
    backdrop = 1,
    options = {
      number = true,
      relativenumber = true,
    },
  },
  on_open = function ()
    vim.opt_local.fillchars = nil
  end
}
