local ok, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
if not ok then
  print("Colorscheme not found!")
  return
end

vim.cmd([[highlight GitSignsAdd guifg=#9ece6a]])
vim.cmd([[highlight GitSignsChange guifg=#7dcfff]])

vim.cmd([[highlight GitSignsDelete guifg=#f7768e]])
vim.cmd([[highlight DiagnosticError guifg=#f7768e]])
