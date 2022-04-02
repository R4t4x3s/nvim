local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("rami.lsp.lsp-installer")
require("rami.lsp.handlers").setup()
