return {
  -- Mason: installs language servers
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = { settings = { expose_as_code_action = "all" } },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- File tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_gitignored = false,
          never_show = {},
        },
      },
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "javascript", "typescript", "tsx", "json", "html", "css" },
      highlight = { enable = true },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-t>]],
      direction = "horizontal",
      size = 15,
    },
  },

  -- Git
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",

  -- Status bar
{
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      globalstatus = true,
    },
  },
},
}
