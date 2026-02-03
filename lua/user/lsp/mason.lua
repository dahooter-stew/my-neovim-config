local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
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
    jdtls,
  },
  automatic_installation = true,
})
