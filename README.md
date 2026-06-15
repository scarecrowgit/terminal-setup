# Terminal Setup Guide

A modern terminal setup with Ghostty, Zsh, Starship, Neovim, Tmux, and AeroSpace with a cohesive One Dark Pro Monokai Darker theme.

## Overview

This repository contains configurations for:
- **Ghostty** - Modern GPU-accelerated terminal emulator
- **Zsh** - POSIX shell with vi mode, aliases, and Starship prompt
- **Starship** - Fast, customizable shell prompt
- **Neovim** - Modern text editor with LSP, file manager, and custom theme
- **Tmux** - Terminal multiplexer for managing panes and windows
- **AeroSpace** - Tiling window manager for macOS

All components share a unified **One Dark Pro Monokai Darker** color theme for visual consistency.

## Prerequisites

### Required Software

1. **Ghostty** - Terminal emulator
   ```bash
   brew install --cask ghostty
   ```

2. **Zsh** - Shell
   ```bash
   brew install zsh
   ```

3. **Starship** - Prompt
   ```bash
   brew install starship
   ```

4. **Neovim** - Text editor (v0.9.0+)
   ```bash
   brew install neovim
   ```

5. **Yazi** - File manager (for Neovim integration)
   ```bash
   brew install yazi
   ```

6. **Tmux** - Terminal multiplexer
   ```bash
   brew install tmux
   ```

7. **AeroSpace** - Tiling window manager
   ```bash
   brew install --cask nikitabobko/tap/aerospace
   ```

## Installation

### 1. Clone or Set Up This Repository

```bash
cd ~/terminal
git init
```

### 2. Install Ghostty Configuration

```bash
mkdir -p ~/.config/ghostty
ln -sf ~/terminal/ghostty/config ~/.config/ghostty/config
ln -sf ~/terminal/ghostty/themes ~/.config/ghostty/themes
```

Ghostty opens your default shell. No auto-wrapping in tmux — start tmux manually when needed.

**Configuration includes:**
- One Dark Pro Monokai Darker theme
- 80% transparency with blur effect
- Font size: 13
- macOS Option key as Alt

### 3. Install Zsh Configuration

```bash
printf '\nif [ -f "$HOME/terminal/zsh/.zshrc" ]; then\n  source "$HOME/terminal/zsh/.zshrc"\nfi\n' >> ~/.zshrc
```

**Configuration includes:**
- Starship prompt integration
- Vi edit mode
- Core aliases (see [Zsh Aliases](#zsh-aliases))
- `autoload/` directory for per-machine overrides (see [Zsh Autoload](#zsh-autoload))

### 4. Install Starship Configuration

```bash
ln -sf ~/terminal/starship/starship.toml ~/.config/starship.toml
```

### 5. Install Neovim Configuration

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
ln -sf ~/terminal/nvim ~/.config/nvim
```

Open Neovim — Lazy.nvim will install plugins automatically. Restart once done.

See [nvim/README.md](nvim/README.md) for detailed Neovim config, keybindings, and customization.

### 6. Install Tmux Configuration

```bash
mkdir -p ~/.config/tmux ~/.tmux
ln -sf ~/terminal/tmux/.tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/terminal/tmux/plugins ~/.tmux/plugins

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/terminal/tmux/plugins/tpm
```

Inside tmux, press `prefix + I` to install all plugins.

### 7. Install AeroSpace Configuration

```bash
mkdir -p ~/.config/aerospace
ln -sf ~/terminal/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
ln -sf ~/terminal/aerospace/cheatsheet.md ~/.config/aerospace/cheatsheet.md
```

AeroSpace starts at login automatically (`start-at-login = true`).

## Post-Installation

### Set Zsh as Default Shell

```bash
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

### Verify Installation

```bash
zsh --version
starship --version
nvim --version
yazi --version
aerospace --version
```

## Usage

### Zsh Aliases

**File operations:**
| Alias | Command |
|-------|---------|
| `ll` | `ls -l` |
| `la` | `ls -la` |
| `v` | `nvim` |
| `..` | `cd ..` |
| `...` | `cd ../..` |

**Git shortcuts:**
| Alias | Command |
|-------|---------|
| `g` | `git` |
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `gl` | `git log` |
| `gd` | `git diff` |

**Other:**
| Alias | Command |
|-------|---------|
| `tmhelp` | Show tmux cheatsheet |
| `aeroshelp` | Show AeroSpace cheatsheet |
| `wttr` | Weather for Batumi |

### Zsh Autoload

The `autoload/` directory is sourced automatically by `zsh/.zshrc` on startup. Use it for machine-specific aliases, env vars, and overrides without touching the shared `.zshrc`.

**Current autoload files:**
- `autoload/aliases.zsh` — extra aliases (`aeroshelp`, `wttr`, `tm`)
- `autoload/env_misc.zsh` — extra env vars (`PATH` additions, `HOMEBREW_NO_ENV_HINTS`)

**Adding your own overrides:**

Create any `.zsh` file in `autoload/`:
```zsh
# autoload/my_overrides.zsh

# Override an existing alias
alias v='hx'   # use helix instead of nvim

# Add env var
export MY_VAR="value"

# Add PATH entry
path+=("/my/custom/bin")
```

The file is picked up automatically. This keeps machine-specific config out of git if `autoload/` entries are gitignored, or versioned if you want to share them.

### Tmux Key Bindings

**Prefix key:** `Ctrl+A`

#### Session Management
| Binding | Action |
|---------|--------|
| `prefix :new-session -s name` | Create named session |
| `prefix S` | Choose and switch session |
| `prefix d` | Detach from session |
| `prefix ^D` | Detach client |
| `tmux ls` | List all sessions |
| `tmux attach -t name` | Attach to session |

#### Window Management
| Binding | Action |
|---------|--------|
| `prefix c` | New window (home dir) |
| `prefix H` | Previous window |
| `prefix L` | Next window |
| `prefix ^A` | Last active window |
| `prefix w` / `W` | List windows |
| `prefix r` | Rename window |
| `prefix R` | Reload config |

#### Pane Management
| Binding | Action |
|---------|--------|
| `prefix s` | Split horizontally (below) |
| `prefix v` | Split vertically (right) |
| `prefix h/j/k/l` | Navigate panes |
| `prefix z` | Toggle pane fullscreen |
| `prefix c` | Kill pane |
| `prefix x` | Swap pane with next |

#### Pane Resizing
| Binding | Action |
|---------|--------|
| `prefix ,` | Resize left (−20) |
| `prefix .` | Resize right (+20) |
| `prefix -` | Resize down (−7) |
| `prefix =` | Resize up (+7) |

#### Copy Mode (Vi)
| Binding | Action |
|---------|--------|
| `prefix [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection |
| `q` | Exit copy mode |

#### Other
| Binding | Action |
|---------|--------|
| `prefix :` | Command prompt |
| `prefix K` | Clear screen |
| `prefix P` | Toggle pane border status |
| `prefix T` | Spotify controls (tmux-spotify) |

**Plugins:**
- [xamut/tmux-weather](https://github.com/xamut/tmux-weather) - Weather in status bar
- [ilya-manin/tmux-spotify](https://github.com/ilya-manin/tmux-spotify) - Spotify controls

### AeroSpace Key Bindings

AeroSpace is the tiling window manager. All bindings use `alt` (Option key).

#### Focus & Move Windows
| Binding | Action |
|---------|--------|
| `alt-h/j/k/l` | Focus left/down/up/right |
| `alt-shift-h/j/k/l` | Move window left/down/up/right |
| `alt-shift-minus` | Shrink window |
| `alt-shift-equal` | Grow window |

#### Layout
| Binding | Action |
|---------|--------|
| `alt-slash` | Toggle tiles (horizontal/vertical) |
| `alt-comma` | Toggle accordion layout |
| `alt-ctrl-f` | Toggle floating/tiling |
| `alt-ctrl-shift-f` | Fullscreen |

#### Workspaces
| Binding | Action |
|---------|--------|
| `alt-1..9` | Switch to workspace |
| `alt-shift-1..9` | Move window to workspace (follows) |
| `alt-tab` | Back and forth |
| `alt-shift-tab` | Move workspace to next monitor |

#### App Quick Launch
| Binding | App |
|---------|-----|
| `alt-g` | Ghostty (new window) |
| `alt-f` | Finder |
| `alt-o` | Obsidian |
| `alt-m` | Mattermost |
| `alt-s` | Safari |
| `alt-c` | Chrome |
| `alt-t` | Telegram |
| `alt-e` | Final Cut Pro |
| `alt-z` | Zen |
| `alt-n` | Notion |

> `alt-g` is smart: if Ghostty is not running it opens it; if already running it opens a new window via `cmd+n`.

#### Service Mode (`alt-shift-;`)
| Key | Action |
|-----|--------|
| `r` | Reset/flatten layout |
| `f` | Toggle floating |
| `backspace` | Close all but current window |
| `esc` | Reload config and exit service mode |

Run `aeroshelp` in the terminal to see the cheatsheet inline.

### Neovim Key Bindings

**Essential shortcuts:**
- `Space` - Leader key
- `jj` or `jk` - Exit insert mode
- `<leader>e` - Open Yazi at current file
- `<leader>E` - Open Yazi at cwd
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep
- `<leader>fe` - Toggle Neo-tree
- `<C-s>` - Save file

See [nvim/README.md](nvim/README.md) for full keybinding reference.

## Customization

### Change Ghostty Theme

Edit `~/terminal/ghostty/config`:
```
theme = one-dark-pro-monokai-darker
```

Available themes: `one-dark-pro-monokai-darker`, `atom-one-dark`, `cyberdream`, `duotone-dark`.

### Adjust Terminal Transparency

```
background-opacity = 0.8      # 0.0 (transparent) to 1.0 (opaque)
background-blur-radius = 10   # 0–20
```

### Add Zsh Aliases or Env Vars

Create a file in `~/terminal/zsh/autoload/`:
```zsh
# autoload/my_stuff.zsh
alias foo='bar --flag'
export MY_TOKEN="abc"
```

No need to edit `zsh/.zshrc`. The autoload directory is sourced automatically.

### Customize Starship Prompt

Edit `~/terminal/starship/starship.toml`. See [Starship docs](https://starship.rs/config/).

### Customize Neovim

- **Keybindings**: `nvim/lua/config/keymaps.lua`
- **Options**: `nvim/lua/config/options.lua`
- **Plugins**: `nvim/lua/plugins/`
- **Colorscheme**: `nvim/lua/plugins/colorscheme.lua`

## Troubleshooting

### Ghostty still starts tmux

Check `~/.config/ghostty/config` — ensure there is no `command =` line. Also check `~/.zshrc` or `~/terminal/zsh/.zshrc` for any tmux auto-start block.

### Ghostty config not loading

1. Check symlink: `ls -la ~/.config/ghostty/`
2. Quit and reopen Ghostty — there is no hot reload.

### Zsh doesn't show Starship prompt

1. Check: `starship --version`
2. Check init directly:
   ```bash
   eval "$(starship init zsh)"
   ```

### Autoload file not being picked up

Ensure the symlink is in place:
```bash
ls -la ~/terminal/zsh/autoload/
```

Files must end in `.zsh` to be sourced.

### AeroSpace bindings not working

Reload config: `alt-shift-;` → `esc`. Check `~/.config/aerospace/aerospace.toml` symlink.

### Neovim plugins not working

```
:Lazy sync
:Lazy log
```

### LSP not working in Neovim

```
:LspInfo
:Mason
```

## Directory Structure

```
terminal/
├── README.md
├── tmux-cheatsheet.md
├── aerospace/
│   ├── aerospace.toml        # AeroSpace config
│   └── cheatsheet.md         # AeroSpace quick reference
├── ghostty/
│   ├── config                # Ghostty config
│   └── themes/               # Color themes
├── zsh/
│   ├── .zshrc                # Main config (aliases, env, Starship, vi mode)
│   └── autoload/
│       ├── aliases.zsh       # Extra aliases (aeroshelp, wttr, tm)
│       └── env_misc.zsh      # Extra env vars
├── starship/
│   └── starship.toml
├── tmux/
│   ├── .tmux.conf
│   └── plugins/
└── nvim/
    ├── README.md
    ├── init.lua
    └── lua/
        ├── config/
        └── plugins/
```

## Updating

```bash
# Pull latest config
cd ~/terminal && git pull

# Update Homebrew packages
brew upgrade ghostty zsh starship neovim yazi tmux

# Update Neovim plugins
nvim +Lazy sync +qa

# Update Tmux plugins
~/.tmux/plugins/tpm/bin/update_plugins all
```

## Resources

- [Ghostty Documentation](https://ghostty.org/docs)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Starship Configuration](https://starship.rs/config/)
- [Neovim Documentation](https://neovim.io/doc/)
- [AeroSpace Guide](https://nikitabobko.github.io/AeroSpace/guide)
- [Yazi Documentation](https://yazi-rs.github.io/)
