return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'mason-org/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    cond = not vim.g.vscode,
    keys = {
        {
            '<leader>DC',
            function()
                require('dap').continue()
            end,
            desc = 'Continue',
        },
        {
            '<leader>DIN',
            function()
                require('dap').step_into()
            end,
            desc = 'Step Into',
        },
        {
            '<leader>DOV',
            function()
                require('dap').step_over()
            end,
            desc = 'Step Over',
        },
        {
            '<leader>DOU',
            function()
                require('dap').step_out()
            end,
            desc = 'Step Out',
        },
        {
            '<leader>DB',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Toggle Breakpoint',
        },
        {
            '<leader>DCB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Set Conditional Breakpoint',
        },
        {
            '<leader>DT',
            function()
                require('dapui').toggle()
            end,
            desc = 'Toggle DAP UI',
        },
        {
            '<leader>DL',
            function()
                require('dap').run_last()
            end,
            desc = 'Run Last Configuration',
        },
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            automatic_installation = false,
            ensure_installed= {},
            handlers  = {
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
            },
        }

        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }
        
        if not dap.adapters["codelldb"] then
            dap.adapters["codelldb"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = {
                        "--port",
                        "${port}",
                    },
                },
            }
        end

        for _, lang in ipairs({ "c", "cpp" }) do
            dap.configurations[lang] = {
                {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch file",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "codelldb",
                    request = "attach",
                    name = "Attach to process",
                    pid = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
            }
        end

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
}
