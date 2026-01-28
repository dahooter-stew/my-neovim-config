-- nvim-tree modern config

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

local api = require("nvim-tree.api")

-- keymaps must live here now
local function on_attach(bufnr)
  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- load default mappings first
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings (vim-like)
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

nvim_tree.setup({
  on_attach = on_attach,

  disable_netrw = true,
  hijack_netrw = true,

  -- git integration
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },

  -- diagnostics
  diagnostics = {
    enable = true,
    icons = {
      hint = "🛈",
      info = "⍰",
      warning = "🛈",
      error = "ⓧ",
    },
  },

  -- keep cwd synced
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },

  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },

  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = true,
      },
    },
  },

  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "📄",  -- Unicode file icon
        symlink = "🔗",  -- Unicode symlink icon
        folder = {
          default = "📁",  -- Folder icon
          open = "📂",     -- Open folder icon
          empty = "🗂️",    -- Empty folder icon
          empty_open = "🗄️", -- Open empty folder icon
          symlink = "🔗",    -- Symlink folder icon
        },

        git = {
          unstaged  = "*",
          staged    = "✓",
          unmerged  = "≠",
          renamed   = "→",
          deleted   = "×",
          untracked = "?",
          ignored   = "○",
        },
      },
    },
  },
})

