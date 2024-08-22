-- Advanced pyright configuration
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "jsonls" })

local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        typeCheckingMode = "basic", -- off, basic, strict
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportAttributeAccessIssue = "none",
        },
      },
    },
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- -- setup formatting
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup { { name = "black" }, }

-- lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.py", "*.lua" }

-- -- setup linting
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "pylint", filetypes = { "python" } } }


-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)


