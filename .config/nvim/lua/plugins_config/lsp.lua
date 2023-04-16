local status_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status_lspconfig, nvim_lsp = pcall(require, 'lspconfig')
local status_lsp_status, lsp_status = pcall(require, 'lsp-status')
local status_neodev, neodev = pcall(require, 'neodev')
if not status_mason_lspconfig and status_lspconfig and status_lsp_status and status_neodev then return end

mason_lspconfig.setup()

lsp_status.config {
  diagnostics = false,
  status_symbol = "[LSP]"
}
lsp_status.register_progress()
lsp_status.messages()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

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

neodev.setup {
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  -- for your Neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = false,
  -- much faster, but needs a recent built of lua-language-server
  -- needs lua-language-server >= 3.6.0
  pathStrict = true,
}

mason_lspconfig.setup_handlers {
  function (server_name)
    nvim_lsp[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
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

  ["lua_ls"] = function()
    nvim_lsp.lua_ls.setup {
      before_init = require("neodev.lsp").before_init,
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
            library = {vim.api.nvim_get_runtime_file("", true), plugins = { "nvim-dap-ui" }, types = true },
            -- library = {
            --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            --   [vim.fn.stdpath("config") .. "/lua"] = true,
            -- },
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

