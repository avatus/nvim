local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end

toggleterm.setup({
  shade_terminals = false,
})
