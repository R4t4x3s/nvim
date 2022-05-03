local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("my_lsp.lsp-installer")
require("my_lsp.handlers").setup()
require("my_lsp.null-ls")
