local setup, nvim_dap_vtext = pcall(require, "nvim-dap-virtual-text")
if not setup then
    return
end

nvim_dap_vtext.setup()
