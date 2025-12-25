# Dotfiles

Personal configuration files for macOS development environment.

## Prerequisites

Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to Fish shell:
```fish
fish_add_path /opt/homebrew/bin
```

## Installation

### 1. Install Dependencies

```bash
brew install neovim fish rust-analyzer
```

### 2. Fish Shell

Copy config:
```bash
mkdir -p ~/.config/fish
cp fish/config.fish ~/.config/fish/
```

Set as default shell:
```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

### 3. Neovim

Copy config:
```bash
mkdir -p ~/.config/nvim/lua
cp nvim/init.lua ~/.config/nvim/
cp nvim/lua/*.lua ~/.config/nvim/lua/
```

Install Packer plugin manager:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install plugins (run inside nvim):
```
:PackerSync
```

Install LSP servers via Mason (run inside nvim):
```
:MasonInstall rust-analyzer codelldb
```

## Neovim Keybindings

### General

| Key | Action |
|-----|--------|
| Space | Leader key |
| Space + e | Toggle file tree |
| Space + ff | Find files |
| Space + fg | Live grep |
| Space + fb | List buffers |
| t | Toggle floating terminal |
| s | Flash jump |
| S | Flash treesitter |

### LSP

| Key | Action |
|-----|--------|
| gd | Go to definition |
| gD | Go to declaration |
| gi | Go to implementation |
| gr | Find references |
| K | Hover documentation |
| Ctrl + k | Signature help |
| Space + rn | Rename symbol |
| Space + ca | Code actions |
| Space + f | Format file |

### Rust-specific

| Key | Action |
|-----|--------|
| Space + a | Rust code actions |
| Space + rr | Run (runnables) |
| Space + rd | Debug (debuggables) |
| Ctrl + Space | Hover actions |

### Autocomplete

| Key | Action |
|-----|--------|
| Tab / Ctrl + n | Next item |
| Shift + Tab / Ctrl + p | Previous item |
| Enter | Confirm selection |
| Ctrl + Space | Trigger completion |
| Ctrl + e | Close menu |

### Debugging (nvim-dap)

| Key | Action |
|-----|--------|
| Space + b | Toggle breakpoint |
| F5 | Continue |
| F10 | Step over |
| F11 | Step into |
| F12 | Step out |

### Diagnostics

| Key | Action |
|-----|--------|
| Space + xx | Toggle diagnostics |
| Space + xd | Document diagnostics |

### Navigation

| Key | Action |
|-----|--------|
| Ctrl + o | Jump back |
| Ctrl + i | Jump forward |

## Directory Structure

```
vishs_dotfiles/
├── README.md
├── fish/
│   └── config.fish
└── nvim/
    ├── init.lua
    └── lua/
        ├── keys.lua
        ├── opts.lua
        ├── plug.lua
        └── vars.lua
```

## Plugins Included

- rustaceanvim - Rust development (LSP, debugging, running)
- nvim-cmp - Autocompletion
- nvim-treesitter - Syntax highlighting
- telescope.nvim - Fuzzy finder
- nvim-tree - File explorer
- nvim-dap / nvim-dap-ui - Debugging
- trouble.nvim - Diagnostics viewer
- flash.nvim - Quick navigation
- vim-floaterm - Floating terminal
- onedark.nvim - Color theme
- Comment.nvim - Toggle comments
- nvim-autopairs - Auto close brackets
- vim-surround - Surround text objects
- indent-blankline - Indent guides
- vim-illuminate - Highlight word under cursor
- todo-comments.nvim - Highlight TODO comments
