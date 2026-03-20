# Terminal Setup Guide

A modern terminal setup with Ghostty, Nushell, Starship, and Neovim with a cohesive One Dark Pro Monokai Darker theme.

## Overview

This repository contains configurations for:
- **Ghostty** - Modern GPU-accelerated terminal emulator
- **Nushell** - Modern shell with structured data pipelines
- **Starship** - Fast, customizable shell prompt
- **Neovim** - Modern text editor with LSP, file manager, and custom theme
- **Tmux** - Terminal multiplexer for managing multiple panes and windows

All components share a unified **One Dark Pro Monokai Darker** color theme for visual consistency.

## Prerequisites

### Required Software

1. **Ghostty** - Terminal emulator
   - Download from [https://ghostty.org/](https://ghostty.org/)
   - Or install via Homebrew: `brew install --cask ghostty`

2. **Nushell** - Shell
   ```bash
   brew install nushell
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

### Optional but Recommended

- **Git** - Version control (likely already installed)
- **Node.js** - For JavaScript/TypeScript LSP support
- **Python 3** - For Python LSP support
- **Rust** - For Rust LSP support
- **Go** - For Go LSP support

## Installation

### 1. Clone or Set Up This Repository

```bash
# If you haven't already, initialize this directory as your config repo
cd ~/terminal
git init
```

### 2. Install Ghostty Configuration

```bash
# Create Ghostty config directory
mkdir -p ~/.config/ghostty

# Symlink the configuration
ln -sf ~/terminal/ghostty/config ~/.config/ghostty/config

# Symlink themes directory
ln -sf ~/terminal/ghostty/themes ~/.config/ghostty/themes
```

**Configuration includes:**
- One Dark Pro Monokai Darker theme
- 80% transparency with blur effect
- Font size: 12
- macOS Option key as Alt

**Available themes:**
- `one-dark-pro-monokai-darker` (default)
- `atom-one-dark`
- `cyberdream`
- `duotone-dark`

To change theme, edit `~/terminal/ghostty/config` and change the first line.

### 3. Install Nushell Configuration

```bash
# Create Nushell config directory (macOS)
mkdir -p ~/Library/Application\ Support/nushell

# Symlink configuration files
ln -sf ~/terminal/nushell/config.nu ~/Library/Application\ Support/nushell/config.nu
ln -sf ~/terminal/nushell/env.nu ~/Library/Application\ Support/nushell/env.nu
ln -sf ~/terminal/nushell/theme.nu ~/Library/Application\ Support/nushell/theme.nu
```

**Note:** On Linux, use `~/.config/nushell` instead of `~/Library/Application Support/nushell`

**Configuration includes:**
- Starship prompt integration
- One Dark Pro Monokai Darker theme
- Vi edit mode for command line editing
- Useful aliases (ll, la, v, g, gs, ga, gc, gp, gl, gd)
- Editor set to nvim
- No banner on startup
- Auto-start tmux on shell startup

### 4. Install Starship Configuration

```bash
# Create Starship config directory
mkdir -p ~/.config

# Symlink configuration
ln -sf ~/terminal/starship/starship.toml ~/.config/starship.toml
```

**Configuration includes:**
- Custom prompt format with decorative lines
- Git branch and status indicators
- Language version indicators (Python, Node.js, Rust, Go)
- Docker context display
- Command duration display
- Color-coded prompt symbols

### 5. Install Neovim Configuration

```bash
# Backup existing Neovim config (if any)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# Create symlink
ln -sf ~/terminal/nvim ~/.config/nvim
```

**First Launch:**

1. Open Neovim:
   ```bash
   nvim
   ```

2. Lazy.nvim will automatically install all plugins (this may take a minute)

3. Restart Neovim after installation completes

4. Language servers will auto-install on first use, or manually install via `:Mason`

**See [nvim/README.md](nvim/README.md) for detailed Neovim configuration, keybindings, and customization.**

### 6. Install Tmux Configuration

```bash
# Create config directory
mkdir -p ~/.config/tmux

# Symlinks are automatically created during installation
# Main config: ~/.tmux.conf → ~/.config/tmux/tmux.conf
# Reset config: ~/.config/tmux/tmux.reset.conf
```

**Configuration includes:**
- Ctrl-A as the prefix key
- Nushell as the default shell (with bash as fallback for compatibility)
- Vi-mode navigation (hjkl instead of arrow keys)
- Smart pane splits that preserve current directory
- Mouse support enabled
- 256 color support
- Status bar at the top (macOS style)
- 10ms escape-time for proper vi mode support in nushell

**Starting tmux:**
```bash
# Use the alias defined in nushell
tm

# Or manually create a new session:
tmux new-session -s work -c $env.PWD
```

## Post-Installation

### Set Nushell as Default Shell

```bash
# Add Nushell to allowed shells
echo $(which nu) | sudo tee -a /etc/shells

# Change default shell
chsh -s $(which nu)
```

### Verify Installation

1. **Restart Ghostty** or open a new terminal

2. **Check shell:**
   ```bash
   $nu.version
   ```

3. **Check Starship:**
   ```bash
   starship --version
   ```

4. **Check Neovim:**
   ```bash
   nvim --version
   ```

5. **Check Yazi:**
   ```bash
   yazi --version
   ```

### Initialize Starship Cache

On first run, Nushell's `env.nu` will automatically create the Starship cache:
```bash
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
```

This happens automatically when you start Nushell for the first time.

## Usage

### Nushell Aliases

The configuration includes these useful aliases:

**File operations:**
- `ll` → `ls -l` (long format listing)
- `la` → `ls -la` (all files, long format)
- `v` → `nvim` (open Neovim)
- `..` → `cd ..` (go up one directory)
- `...` → `cd ../..` (go up two directories)

**Git shortcuts:**
- `g` → `git`
- `gs` → `git status`
- `ga` → `git add`
- `gc` → `git commit`
- `gp` → `git push`
- `gl` → `git log`
- `gd` → `git diff`

### Tmux Key Bindings

**Prefix key:** `Ctrl-A` (then press the key below)

**Session and window management:**
- `c` - Create new window (default tmux behavior)
- `Ctrl-C` - Create new window (in home directory)
- `Ctrl-D` - Detach from session
- `Ctrl-A` - Go to last window
- `H` - Previous window
- `L` - Next window
- `S` - Choose session
- `w` or `Ctrl-W` - List windows
- `r` - Rename window

**Pane management:**
- `s` - Split pane horizontally (preserves current directory)
- `v` - Split pane vertically (preserves current directory)
- `|` - Simple vertical split
- `h` - Navigate to left pane
- `j` - Navigate to down pane
- `k` - Navigate to up pane
- `l` - Navigate to right pane
- `z` - Toggle pane zoom
- `q` - Kill pane
- `x` - Swap panes

**Resizing panes (repeatable):**
- `,` - Resize left (20 units)
- `.` - Resize right (20 units)
- `-` - Resize down (7 units)
- `=` - Resize up (7 units)

**Other:**
- `Ctrl-L` or `l` - Refresh client
- `R` - Reload configuration
- `K` - Clear screen (sends clear command)
- `:` - Enter command mode

### Neovim Key Bindings

**Essential shortcuts:**
- `Space` - Leader key
- `jj` or `jk` - Exit insert mode
- `<leader>e` - Open Yazi file manager at current file
- `<leader>E` - Open Yazi at current working directory
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (search in files)
- `<leader>fe` - Toggle Neo-tree file explorer
- `<C-s>` - Save file

See [nvim/README.md](nvim/README.md) for complete key binding reference.

## Customization

### Change Ghostty Theme

Edit `~/terminal/ghostty/config` (or `~/.config/ghostty/config`):
```
theme = one-dark-pro-monokai-darker
```

Change to one of:
- `one-dark-pro-monokai-darker`
- `atom-one-dark`
- `cyberdream`
- `duotone-dark`

### Adjust Terminal Transparency

Edit `~/terminal/ghostty/config`:
```
background-opacity = 0.8  # Change to 0.0-1.0 (0 = fully transparent, 1 = opaque)
background-blur-radius = 10  # Blur amount (0-20)
```

### Customize Starship Prompt

Edit `~/terminal/starship/starship.toml` to modify:
- Prompt symbols and colors
- Directory truncation
- Git indicators
- Language version displays
- Add/remove modules

See [Starship documentation](https://starship.rs/config/) for all options.

### Modify Nushell Aliases

Edit `~/terminal/nushell/config.nu` (source file) to add or change aliases:
```bash
alias myalias = command args
```

The changes will be reflected since the file is symlinked to `~/Library/Application Support/nushell/config.nu` (macOS)

### Customize Neovim

- **Keybindings**: Edit `nvim/lua/config/keymaps.lua`
- **Options**: Edit `nvim/lua/config/options.lua`
- **Plugins**: Add files in `nvim/lua/plugins/`
- **Colorscheme**: Edit `nvim/lua/plugins/colorscheme.lua`

See [nvim/README.md](nvim/README.md) for detailed customization guide.

## Troubleshooting

### Nushell doesn't show Starship prompt

1. Check if Starship is installed: `starship --version`
2. Verify config location: `ls -la ~/Library/Application\ Support/nushell/` (macOS)
3. Check if env.nu is being loaded: `echo $env.config`
4. Manually regenerate cache:
   ```bash
   mkdir ~/.cache/starship
   starship init nu | save -f ~/.cache/starship/init.nu
   ```

### Ghostty config not loading

1. Check config location: `~/.config/ghostty/config`
2. Verify symlink: `ls -la ~/.config/ghostty/`
3. Restart Ghostty completely (quit and reopen)

### Neovim plugins not working

1. Run `:Lazy sync` in Neovim
2. Check for errors: `:Lazy log`
3. Reinstall: `:Lazy clean` then `:Lazy sync`

### Yazi not opening in Neovim

1. Verify Yazi is installed: `yazi --version`
2. Check Neovim plugin: `:Lazy load yazi.nvim`
3. Try opening manually: `yazi` in terminal

### LSP not working in Neovim

1. Check LSP status: `:LspInfo`
2. Open Mason: `:Mason`
3. Install missing language server
4. Restart Neovim

## Directory Structure

```
terminal/
├── README.md              # This file
├── ghostty/
│   ├── config            # Ghostty configuration
│   └── themes/           # Color themes
│       ├── one-dark-pro-monokai-darker
│       ├── atom-one-dark
│       ├── cyberdream
│       └── duotone-dark
├── nushell/
│   ├── config.nu         # Main Nushell config
│   ├── env.nu            # Environment variables
│   └── theme.nu          # One Dark Pro theme
├── starship/
│   └── starship.toml     # Starship prompt config
├── tmux/
│   └── .tmux.conf        # Tmux configuration
└── nvim/                 # Neovim configuration
    ├── README.md         # Detailed Neovim guide
    ├── init.lua
    └── lua/
        ├── config/       # Core configuration
        └── plugins/      # Plugin configs
```

## Updating

### Update Configurations

```bash
cd ~/terminal
git pull  # If tracking in git
```

Configurations are symlinked, so changes here automatically apply.

### Update Software

```bash
# Update Homebrew packages
brew upgrade ghostty nushell starship neovim yazi

# Update Neovim plugins
nvim +Lazy sync +qa
```

## Backup

Your configurations are in `~/terminal/`. To backup:

```bash
cd ~/terminal
git add .
git commit -m "Update configs"
git push  # If using remote repository
```

Or manually backup:
```bash
tar -czf terminal-configs-backup.tar.gz ~/terminal/
```

## Resources

- [Ghostty Documentation](https://ghostty.org/docs)
- [Nushell Book](https://www.nushell.sh/book/)
- [Starship Configuration](https://starship.rs/config/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Yazi Documentation](https://yazi-rs.github.io/)

## Credits

- **Ghostty** - Mitchell Hashimoto
- **Nushell** - The Nushell Project
- **Starship** - Starship Contributors
- **Neovim** - Neovim Team
- **Yazi** - Yazi Contributors
- **Theme** - One Dark Pro Monokai Darker

## License

These configurations are free to use and modify for personal use.
