local opt = vim.opt

opt.relativenumber = true

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive


-- -- default python location
-- vim.g.python3_host_prog = "/opt/conda/bin/python3.7"

-- -- Mason setup
-- require('mason').setup({
--     PATH = "replace",
--     log_level = vim.log.levels.INFO,
--     max_concurrent_installers = 4,
-- })

-- require('mason-lspconfig').setup({
--   ensure_installed = {
--     'pyright'
--   }
-- }
-- )
