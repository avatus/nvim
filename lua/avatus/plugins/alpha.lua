local alpha_setup, alpha = pcall(require, "alpha")
if not alpha_setup then
  return
end

local start_setup, startify = pcall(require, "alpha.themes.startify")
if not start_setup then
  return
end
