local status, neotree = pcall(require, "neo-tree")
if not status then
  return
end
neotree.setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  enable_git_status = false,
  source_selector = {
    winbar = false,
    content_layout = "center",
    tab_labels = {
      -- filesystem = "[D]",
      -- buffers = astronvim.get_icon("DefaultFile") .. " Bufs",
      -- git_status = astronvim.get_icon("Git") .. " Git",
      -- diagnostics = astronvim.get_icon("Diagnostic") .. " Diagnostic",
    },
  },
  default_component_configs = {
    indent = { padding = 0 },
    icon = {
      -- folder_closed = astronvim.get_icon("FolderClosed"),
      -- folder_open = astronvim.get_icon("FolderOpen"),
      -- folder_empty = astronvim.get_icon("FolderEmpty"),
      -- default = astronvim.get_icon("DefaultFile"),
    },
    git_status = {
      symbols = {
        -- Change type
        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      o = "open",
      -- O = function(state) astronvim.system_open(state.tree:get_node():get_id()) end,
      H = "prev_source",
      L = "next_source",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { mappings = { h = "toggle_hidden" } },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_)
        vim.opt_local.signcolumn = "auto"
      end,
    },
    {
      event = "file_opened",
      handler = function(_)
        require("neo-tree").close_all()
      end,
    },
  },
})
