local dap,dapui = require("dap"), require("dapui")
require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

--dap configurations
dap.adapters.lldb = {
    type = "executable",
    command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        MIMode = "lldb",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.fortran = dap.configurations.cpp
dap.configurations.asm = dap.configurations.cpp

env = function()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
    end
    return varaibles
end
