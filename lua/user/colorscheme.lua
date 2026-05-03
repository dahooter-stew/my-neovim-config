vim.cmd "colorscheme default"

local colorscheme = "gruvbox-material"

vim.g.gruvbox_material_background = "material"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_enable_bold = 1

-- local function toggle_transparency()
--   if vim.g.gruvbox_material_transparent_background == 1 then
--     vim.g.gruvbox_material_transparent_background = 0
--   elseif vim.g.gruvbox_material_transparent_background == 0 then
--     vim.g.gruvbox_material_transparent_background = 1
--   end
-- end
-- vim.api.nvim_create_user_command('MyCommand', toggle_transparency, {})

local status_ok, _ = pcall(
  vim.cmd, "colorscheme " .. colorscheme
)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
