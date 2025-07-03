local dap = require 'dap'
local dapui = require 'dapui'

require('dap-vscode-js').setup {
  debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
}

for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
  dap.configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}',
    },
  }
end

dapui.setup()

dap.listeners.before.event_exited['dapui_config'] = dapui.close
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open { reset = true }
end

local signs = {
  DapBreakpoint = '●',
  DapBreakpointCondition = '●',
  DapLogPoint = '◆',
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, { text = sign, texthl = name })
end
