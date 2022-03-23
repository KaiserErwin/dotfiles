local nvim_lsp = require('lspconfig')
local util = require 'lspconfig.util'
local configs = require'lspconfig/configs'
local protocol = require'vim.lsp.protocol'
local dlsconfig = require 'diagnosticls-configs'
local prettier = require("prettier")

local M = {}

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
vim.fn.sign_define( "LspDiagnosticsSignError", { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts) 
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts) 
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) 
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) 
  buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-S-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

if util.root_pattern(".eslintrc.json", "tsconfig.json", "tslint.json") then
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { 'javascript', 'react','typescript', 'typescriptreact', 'typescript.tsx' },
}
else
nvim_lsp.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript" },
  cmd = { "deno", "lsp" },
  init_options = {
    enable = true,
    lint = true,
    unstable = false
  },
}
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
end

nvim_lsp.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.jsonls.setup {
  cmd = { "vscode-json-languageserver", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.jedi_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.html.setup {
  cmd = { "vscode-html-languageserver", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.cssls.setup {
  cmd = { "vscode-css-languageserver", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.sqls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.phpactor.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.metals.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.grammarly.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
    "html",
    "css",
    "typescriptreact",
    "javascriptreact",
  },
})

dlsconfig.init {
  on_attach = on_attach,
  capabilities = capabilities,
}

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
M.on_attach = on_attach
M.capabilities = capabilities

return M
