-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme horizon")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
