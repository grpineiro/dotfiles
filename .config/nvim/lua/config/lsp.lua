local status_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status_lspconfig, nvim_lsp = pcall(require, 'lspconfig')
if not status_mason_lspconfig and status_lspconfig then return end

mason_lspconfig.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- Format on save
  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  --   vim.api.nvim_command [[augroup END]]
  -- end

end

-- Diagnostic icons
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

mason_lspconfig.setup_handlers {
  function (server_name)
    nvim_lsp[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  end,

  ["rust_analyzer"] = function()
    nvim_lsp.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
              importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
        }
      }
    })
  end,

  ["sumneko_lua"] = function()
    nvim_lsp.sumneko_lua.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"}
          },
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          },
        }
      }
    }
  end
}

-- local servers = { "tsserver", "cssls", "html", "clangd", "jsonls" }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     flags = {
--       debounce_text_changes = 150
--     }
--   }
-- end

