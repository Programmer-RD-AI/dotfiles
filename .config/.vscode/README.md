# VS Code Configuration (`.config/.vscode`)

This folder contains comprehensive workspace settings for Visual Studio Code, specifically configured to provide a seamless Vim experience that matches Neovim and IntelliJ IDEA keybindings for ultimate cross-editor consistency.

## 📁 Main Files

- `settings.json`: Complete VS Code configuration with Vim extension integration, editor preferences, and custom keybindings

## 🎯 Philosophy & Design

This VS Code configuration is designed around several core principles:

- **Vim-First Experience:** Full Vim emulation with VSCodeVim extension
- **Cross-Editor Consistency:** Identical keybindings across Neovim, VS Code, and IntelliJ IDEA
- **Modern Development:** Leverages VS Code's powerful LSP, debugging, and extension ecosystem
- **Productivity Focus:** Optimized for efficient coding with minimal mouse usage

## ⚙️ Core Configuration Features

### Vim Extension Integration

**Enhanced Vim Emulation:**

- **Leader Key:** `<space>` (spacebar) for consistent muscle memory
- **System Clipboard:** Automatic integration with OS clipboard
- **Neovim Backend:** Uses Neovim as the backend for better compatibility
- **Smart Key Handling:** Preserves essential VS Code shortcuts while maintaining Vim behavior

**Vim Settings:**

```json
{
  "vim.leader": "<space>",
  "vim.useSystemClipboard": true,
  "vim.useCtrlKeys": true,
  "vim.enableNeovim": true,
  "vim.neovimPath": "/usr/bin/nvim",
  "vim.vimrc.enable": false
}
```

### Editor Enhancements

**Visual & Performance Optimizations:**

- **Font:** JetBrains Mono with Cascadia Code fallback for optimal readability
- **Theme:** Default Dark+ for comfortable long coding sessions
- **Formatting:** Auto-format on save with 2-space indentation
- **Line Numbers:** Enabled for easy navigation and debugging
- **Word Wrap:** Enabled for better text visibility
- **Minimap:** Available for file overview

**Editor Settings:**

```json
{
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.formatOnSave": true,
  "editor.fontSize": 12,
  "editor.fontFamily": "'JetBrains Mono', 'Cascadia Code', Consolas, 'Courier New', monospace"
}
```

## 🎮 Complete Keybinding Reference

### Universal Leader Key System

**Leader Key:** `<space>` (matches Neovim and IntelliJ for consistency)

### Basic File Operations

- `<leader>w` — Save current file
- `<leader>q` — Close current editor (via `:q` command)

### File Explorer (nvim-tree Style)

- `<leader>ee` — Toggle file explorer (opens Explorer view)
- `<leader>ef` — Focus current file in explorer (reveal in side bar)

### Split Window Management

**Creating Splits:**

- `<leader>sv` — Split editor vertically (editor to the right)
- `<leader>sh` — Split editor horizontally (editor below)
- `<leader>sx` — Close current split
- `<leader>se` — Make splits equal width

**Navigating Splits:**

- `<C-h>` — Move to left editor
- `<C-j>` — Move to bottom editor
- `<C-k>` — Move to top editor
- `<C-l>` — Move to right editor

**Resizing Splits:**

- `<leader>+` — Increase view height
- `<leader>-` — Decrease view height
- `<leader>>` — Increase view width
- `<leader><` — Decrease view width

### Tab Management

- `<leader>to` — Open new untitled file
- `<leader>tx` — Close current tab
- `<leader>tn` — Next tab
- `<leader>tp` — Previous tab

### Harpoon-Style File Marking

**File Bookmarking System (using VS Code pinned tabs):**

- `<leader>ha` — Pin current editor (mark for quick access)
- `<leader>hh` — Show all open editors (quick switcher)
- `<leader>h1` — Jump to editor at index 1
- `<leader>h2` — Jump to editor at index 2
- `<leader>h3` — Jump to editor at index 3
- `<leader>h4` — Jump to editor at index 4
- `<leader>hp` — Previous editor
- `<leader>hn` — Next editor
- `<leader>hx` — Unpin current editor

### System Clipboard Integration

**Normal & Visual Mode:**

- `<leader>p` — Paste from system clipboard (primary)
- `<leader>P` — Paste from system clipboard (secondary)
- `<leader>y` — Copy to system clipboard (primary)
- `<leader>Y` — Copy to system clipboard (secondary)

### Comments & Code Formatting

- `<leader>/` — Toggle line comment (works in normal and visual mode)
- `<space>f` — Format document (normal mode) or selection (visual mode)

### Git Integration

- `<leader>lg` — Open Source Control view (equivalent to LazyGit)

### Telescope-Style Fuzzy Finding

**File Operations:**

- `<leader>ff` — Quick Open (find files)
- `<leader>fg` — Find in Files (live grep)
- `<leader>fb` — Show all open editors (buffers)
- `<leader>fh` — Show Command Palette (help/commands)

**LSP-Enhanced Search:**

- `<leader>fd` — Go to Definition
- `<leader>fr` — Find References
- `<leader>fi` — Go to Implementation
- `<leader>fs` — Go to Symbol in File
- `<leader>fS` — Go to Symbol in Workspace

### LSP & Code Navigation

**Standard LSP Bindings (matches Neovim):**

- `gd` — Go to Definition
- `gD` — Go to Declaration
- `gi` — Go to Implementation
- `gr` — Find References
- `K` — Show Hover Information

**Diagnostics & Error Navigation:**

- `<space>e` — Show hover information/error details
- `[d` — Previous diagnostic/error
- `]d` — Next diagnostic/error
- `<space>q` — Open Problems view

**Advanced LSP Features:**

- `<space>D` — Go to Type Definition
- `<C-k>` — Show signature help/parameter hints
- `<space>rn` — Rename symbol
- `<space>ca` — Code actions (quick fix)

### Workspace Management

- `<space>wa` — Add workspace folder
- `<space>wr` — Remove workspace folder (close project)
- `<space>wl` — List workspace folders

### Terminal Integration

- `<C-\>` — Toggle integrated terminal

### Discovery & Help

- `<leader>?` — Show Command Palette (discover available commands)

## 🔧 Language-Specific Features

### Python Development

**Configuration:**

```json
{
  "python.defaultInterpreterPath": "python3",
  "python.linting.enabled": true,
  "python.linting.pycodestyleEnabled": true
}
```

**Features:**

- Auto-detection of virtual environments
- Integrated debugging with breakpoints
- Code formatting with Black/autopep8
- IntelliSense and autocompletion

### TypeScript/JavaScript Development

**Configuration:**

```json
{
  "typescript.preferences.includePackageJsonAutoImports": "auto"
}
```

**Features:**

- Advanced IntelliSense with type checking
- Auto-imports from package.json
- Integrated Node.js debugging
- ESLint and Prettier integration

### Terminal Integration

**Enhanced Terminal Experience:**

- **Font Consistency:** Same font as editor (JetBrains Mono)
- **Size:** Matched font size (12pt) for visual consistency
- **Toggle:** Quick access with `<C-\>`
- **Multiple Terminals:** Split terminal support

## 🎨 Visual Customization

### Theme & Appearance

- **Color Theme:** "Default Dark+" for reduced eye strain
- **Icon Theme:** "vs-seti" for better file type recognition
- **Font:** JetBrains Mono with programming ligatures
- **Minimap:** Enabled for code overview

### Key Handling Strategy

**Balanced Approach:**

```json
{
  "vim.handleKeys": {
    "<C-a>": false, // Let VS Code handle select all
    "<C-e>": false, // Let VS Code handle go to end
    "<C-f>": false, // Let VS Code handle find
    "<C-v>": false, // Let VS Code handle paste
    "<C-h>": true, // Vim handles split navigation
    "<C-j>": true, // Vim handles split navigation
    "<C-k>": true, // Vim handles split navigation
    "<C-l>": true, // Vim handles split navigation
    "<C-\\>": false // Let VS Code handle terminal toggle
  }
}
```

## 🚀 Workflow Integration

### Cross-Editor Consistency

**Seamless Editor Switching:**

- **Same Leader Key:** `<space>` across Neovim, VS Code, IntelliJ
- **Identical File Navigation:** `<leader>ff`, `<leader>fg` work the same
- **Consistent Split Management:** `<C-h/j/k/l>` for navigation everywhere
- **Universal LSP Bindings:** `gd`, `gr`, `gi` for code navigation

### Development Workflow

**Typical Development Session:**

1. **Open Project:** `<leader>ff` to find and open files
2. **Explore Code:** `gd` to jump to definitions, `gr` for references
3. **Edit Multiple Files:** `<leader>sv` for splits, `<leader>ha` to pin important files
4. **Version Control:** `<leader>lg` to view changes and commit
5. **Testing/Debugging:** Use VS Code's integrated debugging with Vim keybindings

### VS Code Extension Ecosystem

**Recommended Extensions (Auto-configured):**

- **VSCodeVim:** Core Vim emulation
- **Python:** Full Python development support
- **TypeScript:** Enhanced JavaScript/TypeScript features
- **GitLens:** Advanced Git integration
- **Bracket Pair Colorizer:** Visual bracket matching
- **Auto Rename Tag:** HTML/XML tag management

## 🔧 Customization Guide

### Personal Keybinding Overrides

**Add Custom Keybindings:**

```json
{
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<leader>", "custom"],
      "commands": ["your.custom.command"]
    }
  ]
}
```

**Disable Unwanted Keybindings:**

```json
{
  "vim.handleKeys": {
    "<C-your-key>": false
  }
}
```

### Theme Customization

**Change Color Scheme:**

```json
{
  "workbench.colorTheme": "Dracula",
  "workbench.iconTheme": "material-icon-theme"
}
```

**Font Adjustments:**

```json
{
  "editor.fontFamily": "'Fira Code', monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 14
}
```

### Language-Specific Overrides

**Per-Language Settings:**

```json
{
  "[python]": {
    "editor.tabSize": 4,
    "editor.insertSpaces": true
  },
  "[javascript]": {
    "editor.tabSize": 2,
    "editor.insertSpaces": true
  }
}
```

## 🛠️ Troubleshooting

### Common Issues

**Vim Extension Not Working:**

1. Ensure VSCodeVim extension is installed and enabled
2. Check if Neovim is installed at the specified path
3. Restart VS Code after configuration changes

**Keybindings Conflicts:**

1. Check `vim.handleKeys` settings
2. Use Command Palette to see conflicting shortcuts
3. Disable VS Code shortcuts that conflict with Vim

**Performance Issues:**

1. Disable unused extensions
2. Check if Neovim backend is causing issues
3. Consider using VS Code's built-in Vim mode if Neovim is problematic

### Configuration Validation

**Test Your Setup:**

```bash
# Verify Neovim integration
which nvim

# Check VS Code settings
code --list-extensions | grep vim

# Test keybindings
# Open VS Code and try <leader>ff, <leader>ee, etc.
```

## 📚 Additional Resources

### Learning Resources

- **VSCodeVim Documentation:** [GitHub Repository](https://github.com/VSCodeVim/Vim)
- **VS Code Keyboard Shortcuts:** Use `Ctrl+K Ctrl+S` to view/edit
- **Vim Tutorial:** Run `vimtutor` in terminal for Vim basics

### Integration Guides

- **Cross-Editor Setup:** See main dotfiles README.md
- **Neovim Comparison:** Check `.config/nvim/README.md`
- **IntelliJ Integration:** See `.config/.idea/README.md`

---

**Pro Tip:** Use `<leader>?` (Command Palette) to discover new VS Code commands and create custom keybindings for your workflow!

**Remember:** This configuration prioritizes Vim muscle memory while leveraging VS Code's powerful IDE features. The best of both worlds! 🚀
