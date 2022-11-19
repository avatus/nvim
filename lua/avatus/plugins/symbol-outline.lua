local setup, symbol_outline = pcall(require, "symbols-outline")
if not setup then
  return
end

symbol_outline.setup({
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = false,
  relative_width = true,
  width = 25,
  show_guides = false,
  auto_close = true,
})
