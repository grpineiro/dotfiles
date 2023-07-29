local status_dap, dap = pcall(require, "dap")
local status_dapui, dapui = pcall(require, "dapui")
local status_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
if not status_dap and status_dapui and status_mason_dap then return end

dapui.setup()

mason_dap.setup({
  handlers = {
    function(source_name)
      require("mason-nvim-dap").default_setup(source_name)
    end
  }
})
