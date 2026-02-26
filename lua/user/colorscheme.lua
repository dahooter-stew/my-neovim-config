vim.cmd "colorscheme default"

local colorscheme = "gruvbox-material"

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_contrast = "hard"
vim.g.gruvbox_material_enable_bold = 1

local status_ok, _ = pcall(
  vim.cmd, "colorscheme " .. colorscheme
)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
