local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

local mason_dap, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not mason_dap then
    return
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "clangd", --c and c++
        "jdtls", --java
        "pyright", --python
        "fortls", --fortran
        "ltex", -- markdown, latex
    } 
})

mason_null_ls.setup({
    ensure_installed = {
        "fprettify", --fortran
        "black", --python
        "gfortran", --fortran
        "asmfmt", --asm
    }
})

mason_nvim_dap.setup({
    ensure_installed = {
        "codelldb"
    }
})
