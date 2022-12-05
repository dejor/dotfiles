vim.cmd "colorscheme default"

local colorscheme = "base16-snazzy"

if colorscheme == "snazzy" then
  vim.cmd "let g:SnazzyTransparent = 1"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
