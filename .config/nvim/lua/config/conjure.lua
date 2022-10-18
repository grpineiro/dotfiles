local status, conjure = pcall(require,'conjure.client.common-lisp.swank')
if not status then return end


-- Configuration for Nyxt browser.

local nyxt_group = vim.api.nvim_create_augroup("NyxtBrowser", { clear = true })

if vim.fs.dirname(vim.fs.find({ 'config.lisp' }, { upward = true })[1]) then
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lisp",
    callback = function ()
      local function connect()
        conjure.connect({
          host = "127.0.0.1",
          port = "4006"
        })
      end
      local ok, result = pcall(connect)
      if ok then
        return result
      else repeat
        return result
      until (ok ~= false)
      end
    end,
    group = nyxt_group,
    once = true
  })
end
