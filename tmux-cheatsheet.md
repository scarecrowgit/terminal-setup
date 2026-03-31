# Tmux Cheat Sheet - Your Config

**Prefix Key:** `Ctrl+A` (not the default Ctrl+B)

## Session Management
| Command | Action |
|---------|--------|
| `Ctrl+A :new-session -s name` | Create new session |
| `Ctrl+A S` | Choose and switch to session |
| `tmux ls` | List all sessions |
| `Ctrl+A d` | Detach from current session |
| `Ctrl+A ^D` | Detach client |
| `tmux attach -t name` | Attach to session |

## Window Management
| Command | Action |
|---------|--------|
| `Ctrl+A c` | Create new window (in home directory) |
| `Ctrl+A H` | Previous window |
| `Ctrl+A L` | Next window |
| `Ctrl+A ^A` | Last active window |
| `Ctrl+A w` | List windows |
| `Ctrl+A W` | List windows (interactive) |
| `Ctrl+A r` | Rename current window |
| `Ctrl+A R` | Reload tmux config |

## Pane Management (vim navigation)
| Command | Action |
|---------|--------|
| `Ctrl+A s` | Split vertically (below) |
| `Ctrl+A v` | Split horizontally (right) |
| `Ctrl+A h` | Move to left pane |
| `Ctrl+A j` | Move to down pane |
| `Ctrl+A k` | Move to up pane |
| `Ctrl+A l` | Move to right pane |
| `Ctrl+A c` | Kill pane |
| `Ctrl+A z` | Toggle pane fullscreen |

## Pane Resizing
| Command | Action |
|---------|--------|
| `Ctrl+A ,` | Resize pane left (-20) |
| `Ctrl+A .` | Resize pane right (+20) |
| `Ctrl+A -` | Resize pane down (-7) |
| `Ctrl+A =` | Resize pane up (+7) |
| `Ctrl+A x` | Swap pane with next |

## Copy Mode (Vi keys)
| Command | Action |
|---------|--------|
| `Ctrl+A [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection |
| `q` | Exit copy mode |

## Other Commands
| Command | Action |
|---------|--------|
| `Ctrl+A :` | Command prompt |
| `Ctrl+A *` | List clients / Sync panes |
| `Ctrl+A P` | Toggle pane border status |
| `Ctrl+A K` | Clear screen |
| `Ctrl+A X` | Lock server |

