local config = {
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  floating_window_off_y = -1,
}

require "lsp_signature".setup(config)
