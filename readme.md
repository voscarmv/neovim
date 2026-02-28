# 🚀 Neovim Configuration

Welcome to this professional Neovim setup! This configuration is designed to be lightweight yet powerful, specifically tailored for modern web development (JavaScript, TypeScript, HTML, CSS).

The configuration is located in: `~/.config/nvim`

## 📂 Project Structure

```text
~/.config/nvim/
├── init.lua           # Entry point & basic options
├── lazy-lock.json      # Plugin versions lockfile
└── lua/
    ├── keymaps.lua    # All custom keybindings
    └── plugins/
        └── init.lua   # Plugin declarations & configuration
```

---

## 🛠️ Core Functionalities

### 1. Package Management (`lazy.nvim`)
The config uses **[Lazy.nvim](https://github.com/folke/lazy.nvim)** for lightning-fast plugin loading and management.
- ✨ **Auto-bootstrapping**: Clones itself automatically on first run.
- 📦 **UI**: Open the plugin manager with `:Lazy`.

### 2. Language Server Protocol (LSP)
Full IDE-like features including autocompletion, go-to-definition, and diagnostics.
- **Mason**: Installs LSPs and tools automatically. Run `:Mason` to manage.
- **TypeScript Tools**: Enhanced support for TS/JS projects (imports, refactoring).
- **Diagnostics**: Real-time error and warning highlighting in the gutter.

### 3. Autocompletion (`nvim-cmp`)
Intelligent code completion powered by LSP and snippets.
- Use `<Tab>` and `<S-Tab>` to navigate suggestions.
- Use `<CR>` (Enter) to confirm.
- Use `<C-Space>` to trigger manually.

### 4. Fuzzy Finder (`Telescope`)
The ultimate tool for finding files, strings, and symbols.
- **Find Files**: Fast file switching across the project.
- **Live Grep**: Search for text within all files (requires `ripgrep`).

### 5. File Explorer (`Neo-tree`)
A modern, sidebar-style file explorer with Git integration.
- Shows Git status (added, modified) directly in the tree.
- Reveals hidden files and respects `.gitignore`.

### 6. Syntax Highlighting (`Treesitter`)
Advanced parsing for beautiful and accurate syntax highlighting.
- Built-in support for: JS, TS, TSX, JSON, HTML, CSS.

### 7. Integrated Terminal (`ToggleTerm`)
A floating/horizontal terminal accessible without leaving Neovim.

---

## ⌨️ Useful Keybindings

### LSP & Diagnostics
| Key | Action |
|-----|--------|
| `gd` | **G**o to **D**efinition |
| `gr` | Find **R**eferences |
| `K` | Show documentation (Hover) |
| `<leader>rn` | **R**e**n**ame symbol |
| `<leader>ca` | **C**ode **A**ctions |
| `[d` / `]d` | Previous/Next Diagnostic |
| `gi` | Go to **I**mplementation |

### Navigation & UI
| Key | Action |
|-----|--------|
| `<C-p>` | Find project files (Telescope) |
| `<leader>fg` | **F**ind **G**rep (Search in files) |
| `<C-b>` | Toggle Neo-tree sidebar |
| `<C-` \` `>` | Toggle Terminal |

### TypeScript Specific (`<leader>` + prefix)
| Key | Action |
|-----|--------|
| `<leader>oi` | **O**rganize **I**mports |
| `<leader>ru` | **R**emove **U**nused imports |

---

## 📦 Dependencies
To get the most out of this config, ensure you have these installed on your system:
- **Neovim** (v0.9+)
- **Nerd Font** (highly recommended for icons in status bar/explorer)
- **Ripgrep** (`rg`) - for fast telescope searching.
- **Node.js** & **npm** - for language servers.
