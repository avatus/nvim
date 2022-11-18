local line_ok, fzf = pcall(require, "fzf-lua")
if not line_ok then
  return
end

fzf.setup({
  winopts = {
    split = "belowright new",
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
})
