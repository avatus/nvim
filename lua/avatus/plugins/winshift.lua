local ok, winshift = pcall(require, "winshift")
if not ok then
  return
end

winshift.setup()
