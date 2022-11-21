local line_ok, fzf = pcall(require, "fzf-lua")
if not line_ok then
  return
end

local actions_ok, actions = pcall(require, "fzf-lua.actions")
if not actions_ok then
  return
end

fzf.setup({
  winopts = {
    border = "single",
  },
  files = {
    git_icons = false,
    file_icons = false,
  },
  keymap = {
    fzf = {
      ["tab"] = "down",
      ["btab"] = "up",
    },
  },
  actions = {
    files = {
      ["default"] = actions.file_edit_or_qf,
      ["ctrl-f"] = actions.file_vsplit,
      ["ctrl-space"] = actions.file_split,
    },
    buffers = {
      ["default"] = actions.file_edit_or_qf,
      ["ctrl-f"] = actions.file_vsplit,
      ["ctrl-space"] = actions.file_split,
    },
  },
})
