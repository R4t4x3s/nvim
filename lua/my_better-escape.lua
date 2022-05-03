local status_ok, better = pcall(require, "better_escape")
if not status_ok then
  return
end

better.setup({
  mapping = {"jk"},
  timeout = 110 -- must be > 100 to work properly
})
