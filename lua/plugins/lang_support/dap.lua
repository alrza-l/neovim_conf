return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    'mfussenegger/nvim-dap',

    config = function(_)
      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        require('dap').step_out()
      end)
      vim.keymap.set('n', '<Leader>b', function()
        require('dap').toggle_breakpoint()
      end)
      vim.keymap.set('n', '<Leader>B', function()
        require('dap').set_breakpoint()
      end)
      vim.keymap.set('n', '<Leader>lp', function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end)
      vim.keymap.set('n', '<Leader>dr', function()
        require('dap').repl.open()
      end)
      vim.keymap.set('n', '<Leader>dl', function()
        require('dap').run_last()
      end)
    end,
  },
}