local colorscheme="tokyonight"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
  print("colorscheme" .. colorscheme .. " not found!")
  return
end
