local config = {
  bind = true,
  handler_opts = {
    border = "rounded"
  }
}

require "lsp_signature".setup(config)
