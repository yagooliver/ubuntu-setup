#!/bin/bash

set -e

echo "Starting Neovim Full Configuration Setup..."

# === Ensure Neovim is installed ===
if ! command -v nvim &> /dev/null; then
    echo "Neovim is not installed. Installing via DNF..."
    sudo dnf install -y neovim
fi

# === Install lazy.nvim (Plugin Manager) ===
echo "Installing lazy.nvim plugin manager..."
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/site/pack/lazy/start/lazy.nvim

# === Create config folders ===
mkdir -p ~/.config/nvim

# === Create init.lua with full config ===
echo "Creating Neovim init.lua config..."

cat << 'EOF' > ~/.config/nvim/init.lua
-- =========================================
-- Ultimate Neovim Setup for Dev (C#, ReactJS)
-- =========================================

-- Auto-install lazy.nvim if missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
  -- Theme
  { "catppuccin/nvim", name = "catppuccin" },

  -- LSP
  { "neovim/nvim-lspconfig" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- File explorer
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },

  -- Telescope (fuzzy finder)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git signs
  { "lewis6991/gitsigns.nvim" },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },
})

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"

-- Colors
vim.cmd.colorscheme "catppuccin"

-- LSP Setup
local lspconfig = require("lspconfig")

local servers = { "tsserver", "html", "cssls", "pyright", "bashls", "omnisharp" }
for _, server in ipairs(servers) do
  lspconfig[server].setup {}
end

-- nvim-cmp Setup (autocomplete)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }
  })
})

-- Nvim-tree Setup
require("nvim-tree").setup()

-- Gitsigns Setup
require("gitsigns").setup()

-- Lualine Setup
require("lualine").setup({
  options = { theme = "catppuccin" }
})
EOF

echo "init.lua created at ~/.config/nvim/init.lua"

# === Reminder to install LSP servers ===
echo ""
echo "Now install LSP servers globally:"
echo "  npm install -g typescript typescript-language-server eslint vscode-langservers-extracted bash-language-server"
echo "  pip install pyright"
echo "  sudo dnf install -y omnisharp"
echo ""

echo "Neovim Configuration Complete!"
echo "Launch Neovim with 'nvim' and plugins will auto install!"
