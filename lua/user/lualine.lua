local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = "E ", warn = "W " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local mode = {
	"mode",
  separator = { left = '' },
  right_padding = 2,
	fmt = function(str)
		return str
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "⎇",
}

local buffers = {
  "buffers",
  hide_filename_extension = true,
  icons_enabled = false,
  mode = 2,
}

local location = {
	"location",
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local component_separator = vim.fn.winwidth(0) > 80 and "|" or " "

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = component_separator,
    disabled_filetypes = {
      statusline = { "dashboard", "nvimtree", "outline" },
    },

		always_divide_middle = false,
	},
	sections = {
    lualine_a = { mode },
    lualine_b = {},
    lualine_c = { buffers },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { branch, diagnostics, filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
