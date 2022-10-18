local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local function has_eslint_configured(utils)
  local files = { ".eslintrc.js", ".eslintrc.ts", ".eslintrc.json" }
  for _, match in ipairs(files) do
    return utils.root_has_file(match)
  end
  -- return utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.ts")
end

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_configured }),
    null_ls.builtins.formatting.eslint_d.with({ condition = has_eslint_configured }),
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
      condition = has_eslint_configured
    }),
    null_ls.builtins.formatting.prettierd.with({
      condition = function()
        return #null_ls.get_source({
          name = "eslint_d",
          method = null_ls.methods.FORMATTING,
        }) == 0
      end
    }),
  },
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.format() end
      })
    end
  end,
}

