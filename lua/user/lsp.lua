require("lspconfig")

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "/",
			package_pending = "_",
			package_uninstalled = "x",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = {
    clangd,
    lua_ls,
    jsonls,
    pyright,
    javasc,
    html,
    cssls,
  },
  automatic_installation = true,
})

vim.diagnostic.config({
    virtual_text = {
        enabled = true,
        text_align = "after", -- or "right"
    },
    signs = {
      active = {
        { name = "DiagnosticSignError", text = "ⓧ" },
        { name = "DiagnosticSignWarn", text = "⚠" },
        { name = "DiagnosticSignHint", text = "🛈" },
        { name = "DiagnosticSignInfo", text = "⍰" },
      }
    },
    underlines = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
    -- other diagnostic configurations like signs, underlines, etc.
})


vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
