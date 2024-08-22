lvim.plugins = {
  "nvim-lua/plenary.nvim",          -- lua functions that many plugins use
  -- { "williamboman/mason.nvim",
  --   branch = "latest-commit",
  -- },
  "williamboman/mason.nvim",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>m", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
  "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
  end,
  },
  -- python required plugins
  "ChristianChiarulli/swenv.nvim",  -- switch python conda environment
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/nvim-nio",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  -- lsp related plugins
  {
    "rmagatti/goto-preview",
    config = function()
    require('goto-preview').setup {
          width = 120; -- Width of the floating window
          height = 25; -- Height of the floating window
          default_mappings = true; -- Bind default mappings
          debug = false; -- Print debug information
          opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
          post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
          -- You can use "default_mappings = true" setup option
          -- Or explicitly set keybindings
          -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
          -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
          -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require"lsp_signature".setup({
        -- …
      })
    end,
  },
}

require("user.languages.debugpy")

lvim.lsp.on_attach_callback = function(client, bufnr)
  -- …
  require"lsp_signature".on_attach()
  -- …
end
