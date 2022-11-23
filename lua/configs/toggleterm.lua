local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end

toggleterm.setup({
  direction = "tab",
  open_mapping = "\\",
  hidden = true,
  insert_mappings = false,
  terminal_mappings = true,
  start_in_insert = true,
  on_open = function()
    vim.cmd("startinsert!")
  end,
})
