# IntelliJ IDEA Configuration (`.config/.idea`)

This folder contains comprehensive configuration for JetBrains IDEs (IntelliJ IDEA, PyCharm, WebStorm, etc.) using IdeaVim plugin to provide a complete Vim experience that seamlessly integrates with the IDE's powerful features.

## 📁 Files

- `.ideavimrc`: Complete IdeaVim configuration with custom keybindings that match Neovim and VS Code

## 🎯 Philosophy & Design

This IntelliJ configuration bridges the gap between Vim's efficient text editing and JetBrains IDEs' advanced development features:

- **Vim-First Approach:** Full Vim emulation with IdeaVim plugin
- **IDE Integration:** Leverages IntelliJ's refactoring, debugging, and analysis tools
- **Cross-Editor Consistency:** Identical keybindings across Neovim, VS Code, and IntelliJ
- **Power User Focus:** Optimized for developers who want Vim efficiency with IDE intelligence

## ⚙️ Core Configuration Features

### IdeaVim Setup

**Essential Vim Configuration:**

```vim
let mapleader = " "                    " Space as leader key
set clipboard=unnamedplus              " System clipboard integration
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
```

**Smart Integration:**

- Seamless navigation between IDE panels and Vim modes
- System clipboard synchronization
- Relative line numbers for efficient navigation
- Leader key system matching other editors

### Enhanced Navigation System

**Split/Window Management:**

- Full integration with IntelliJ's split editor system
- Vim-style split creation and navigation
- Smart resize commands that work with IDE panels
- Focus management between editors and tool windows

**Advanced Features:**

- Integrates with IntelliJ's powerful search and navigation
- Works seamlessly with debugger and profiler
- Maintains Vim workflow within IDE context

## 🎮 Complete Keybinding Reference

### Universal Leader Key

**Leader Key:** `<space>` (consistent across all editors)

### Basic File Operations

- `<leader>w` — Save all files
- `<leader>q` — Close current editor tab

### File Management & Navigation

**Project Navigation:**

- `<leader>ee` — Toggle Project tool window (file explorer)
- `<leader>ef` — Select current file in Project view (reveal in sidebar)

**File Finding (Telescope-style):**

- `<leader>ff` — Go to File (Ctrl+Shift+N equivalent)
- `<leader>fg` — Find in Path (global search)
- `<leader>fb` — Recent Files browser
- `<leader>fh` — Show All Actions (Action search)

### Split Window Management

**Creating & Managing Splits:**

- `<leader>sv` — Split editor vertically
- `<leader>sh` — Split editor horizontally
- `<leader>sx` — Unsplit (close current split)
- `<leader>se` — Change split orientation

**Navigating Splits:**

- `<C-h>` — Move focus to left split
- `<C-j>` — Move focus to down split
- `<C-k>` — Move focus to up split
- `<C-l>` — Move focus to right split

**Resizing Splits:**

- `<leader>+` — Stretch split to top
- `<leader>-` — Stretch split to bottom
- `<leader>>` — Stretch split to right
- `<leader><` — Stretch split to left

### Tab Management

- `<leader>to` — Create new file
- `<leader>tx` — Close current tab
- `<leader>tn` — Next tab
- `<leader>tp` — Previous tab
- `<leader>tf` — Move tab to right

### Harpoon-Style File Bookmarking

**Quick File Access (using IntelliJ Favorites):**

- `<leader>ha` — Add current file to Favorites
- `<leader>hh` — Show Favorites
- `<leader>h1` — Go to tab 1
- `<leader>h2` — Go to tab 2
- `<leader>h3` — Go to tab 3
- `<leader>h4` — Go to tab 4
- `<leader>hp` — Previous tab
- `<leader>hn` — Next tab
- `<leader>hx` — Remove from Favorites

### System Clipboard Integration

**Both Normal and Visual Modes:**

- `<leader>y` — Copy to system clipboard (primary)
- `<leader>Y` — Copy to system clipboard (secondary)
- `<leader>p` — Paste from system clipboard (primary)
- `<leader>P` — Paste from system clipboard (secondary)

### Code Navigation & LSP Features

**Standard LSP Navigation:**

- `gd` — Go to Declaration
- `gD` — Go to Type Declaration
- `gi` — Go to Implementation
- `gr` — Find Usages (references)
- `K` — Quick Documentation (hover info)

**Enhanced LSP Search (Telescope-style):**

- `<leader>fd` — Go to Declaration
- `<leader>fr` — Find Usages
- `<leader>fi` — Go to Implementation
- `<leader>fs` — File Structure popup (symbols in file)
- `<leader>fS` — Go to Symbol (workspace symbols)

**Diagnostics & Error Navigation:**

- `<space>e` — Show Error Description
- `[d` — Go to Previous Error
- `]d` — Go to Next Error
- `<space>q` — Activate Problems view

### Refactoring & Code Actions

- `<space>rn` — Rename Element
- `<space>ca` — Show Intention Actions (code actions)
- `<space>f` — Reformat Code
- `<space>D` — Go to Type Declaration

### Comments & Code Formatting

- `<leader>/` — Toggle line comment (normal and visual mode)

### Git Integration

- `<leader>lg` — Activate Version Control tool window

### Terminal Integration

- `<C-\>` — Activate Terminal tool window

### Discovery & Help

- `<leader>?` — Show All Actions (discovery helper)

### Workspace Management

- `<space>wa` — Open Module Settings (add workspace)
- `<space>wr` — Close Project (remove workspace)
- `<space>wl` — Manage Recent Projects (list workspaces)

## 🛠️ IDE-Specific Features

### Advanced Development Tools

**Run & Debug:**

- `<leader>rr` — Run current configuration
- `<leader>rd` — Debug current configuration
- `<leader>rs` — Stop running application

**Database Integration:**

- `<leader>db` — Activate Database tool window

**Debugging:**

- `<leader>bp` — Toggle Line Breakpoint

### Intelligent Code Features

**Code Analysis:**

- **Inspections:** Real-time code analysis and suggestions
- **Quick Fixes:** Automatic problem resolution
- **Refactoring:** Safe rename, extract method, move class
- **Code Generation:** Generate getters/setters, constructors, tests

**Advanced Navigation:**

- **Call Hierarchy:** See caller/callee relationships
- **Type Hierarchy:** Browse class inheritance
- **Usage Search:** Find all usages with context
- **Implementation Search:** Find interface implementations

### Language-Specific Features

**Java Development:**

- Maven/Gradle integration
- Advanced refactoring tools
- Unit test generation and running
- Code coverage analysis

**Python Development (PyCharm):**

- Virtual environment management
- Package installation and management
- Scientific tools integration (NumPy, Pandas)
- Jupyter notebook support

**JavaScript/TypeScript (WebStorm):**

- Node.js debugging and profiling
- npm/yarn package management
- Framework-specific tools (React, Vue, Angular)
- Built-in REST client

## 🎨 Customization & Configuration

### IdeaVim Settings

**Enable IdeaVim Actions:**

```vim
" Add to .ideavimrc for more IDE integration
set ideajoin
set ideastatusicon=gray
set idearefactormode=keep
```

**Plugin Integration:**

```vim
" Enable IdeaVim plugins
set surround
set multiple-cursors
set commentary
set argtextobj
set textobj-entire
```

### Personal Customization

**Add Custom Mappings:**

```vim
" Add to .ideavimrc
nmap <leader>custom :action YourCustomAction<CR>
```

**IDE-Specific Shortcuts:**

```vim
" Database shortcuts
nmap <leader>ds :action DatabaseView.OpenDdlInConsole<CR>
nmap <leader>dt :action DatabaseView.ShowDiff<CR>

" Testing shortcuts
nmap <leader>tc :action RunClass<CR>
nmap <leader>tm :action RunMethod<CR>
```

### Theme & Appearance Integration

**Consistent Theming:**

- Choose dark themes that match terminal/Neovim setup
- Configure font to match other editors (JetBrains Mono)
- Adjust line spacing and font size for consistency

**Recommended Themes:**

- Darcula (default dark theme)
- Material Theme UI
- One Dark theme
- Dracula theme

## 🚀 Workflow Integration

### Cross-Editor Development

**Seamless Workflow:**

1. **Quick Navigation:** Same `<leader>ff` shortcut across all editors
2. **Split Management:** Identical `<C-h/j/k/l>` navigation
3. **LSP Features:** Consistent `gd`, `gr`, `gi` shortcuts
4. **File Operations:** Same `<leader>w`, `<leader>/` commands

**When to Use IntelliJ:**

- **Complex Refactoring:** Use IntelliJ's advanced refactoring tools
- **Debugging:** Leverage powerful debugger with Vim navigation
- **Database Work:** Utilize integrated database tools
- **Framework Development:** Take advantage of framework-specific features

### Development Best Practices

**Efficient Workflow:**

1. **Project Setup:** Use `<leader>ee` to explore project structure
2. **Code Navigation:** Jump between files with `<leader>ff`, definitions with `gd`
3. **Editing:** Use Vim motions for efficient text manipulation
4. **Refactoring:** Leverage `<space>rn` for safe renaming
5. **Debugging:** Set breakpoints with `<leader>bp`, debug with `<leader>rd`

## 🔧 Advanced Configuration

### Multiple Cursors & Selection

**Multi-Cursor Support:**

```vim
" Enable multiple cursors (add to .ideavimrc)
set multiple-cursors
map <C-n> <Plug>NextWholeOccurrence
map <C-x> <Plug>SkipOccurrence
map <C-p> <Plug>RemoveOccurrence
```

### Text Objects & Motions

**Enhanced Text Objects:**

```vim
" Enable advanced text objects
set textobj-entire
set argtextobj

" 'ae' and 'ie' for entire file
" 'aa' and 'ia' for argument text objects
```

### Surround Operations

**Surround Plugin:**

```vim
set surround

" Usage examples:
" cs"' - change surrounding quotes from " to '
" ds" - delete surrounding quotes
" ysiw] - surround inner word with brackets
```

## 🛠️ Troubleshooting

### Common Issues

**IdeaVim Not Working:**

1. Ensure IdeaVim plugin is installed and enabled
2. Restart IDE after configuration changes
3. Check if .ideavimrc is in the correct location

**Keybinding Conflicts:**

1. Use `:actionlist` to see available actions
2. Check IDE keymap settings for conflicts
3. Disable conflicting IDE shortcuts

**Performance Issues:**

1. Disable unused plugins
2. Increase IDE memory allocation
3. Check if complex .ideavimrc is causing slowdowns

### Configuration Validation

**Test Your Setup:**

```vim
" Test in IdeaVim command mode
:echo mapleader
:actionlist RunClass
:source ~/.ideavimrc
```

**Verify Actions:**

```vim
" Check if actions are available
:actionlist Database
:actionlist Git
:actionlist Debug
```

## 📚 Learning Resources

### IdeaVim Documentation

- **GitHub:** [JetBrains/ideavim](https://github.com/JetBrains/ideavim)
- **Actions List:** Use `:actionlist` in IdeaVim to see all available actions
- **Plugin Documentation:** Check JetBrains plugin marketplace

### Integration Resources

- **Cross-Editor Setup:** Main dotfiles README.md
- **Neovim Comparison:** `.config/nvim/README.md`
- **VS Code Integration:** `.config/.vscode/README.md`

### Advanced Features

- **IntelliJ Documentation:** Official JetBrains documentation
- **Vim Tutorial:** Run `vimtutor` to master Vim basics
- **IdeaVim Tips:** Community tips and tricks online

## 💡 Pro Tips

### Efficient Development

1. **Learn IDE Actions:** Use `:actionlist` to discover powerful IDE features
2. **Combine Strengths:** Use Vim for editing, IDE for analysis and debugging
3. **Custom Mappings:** Create shortcuts for frequently used IDE actions
4. **Plugin Ecosystem:** Explore IdeaVim plugins for enhanced functionality

### Muscle Memory

- Practice the same keybindings across all editors
- Start with basic navigation, gradually add complex shortcuts
- Use `<leader>?` to discover new IDE actions
- Create cheat sheets for IDE-specific features

---

**Remember:** IdeaVim gives you the best of both worlds - Vim's efficient editing with IntelliJ's powerful IDE features. Master the combination for maximum productivity! 🚀

**Quick Start:** Install IdeaVim plugin → Copy .ideavimrc → Restart IDE → Start using `<space>` leader key! ⚡
