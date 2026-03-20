# Nushell Config File

# Starship prompt
use ~/.cache/starship/init.nu

# One Dark Pro Monokai Darker Theme
use theme.nu

# Apply theme
$env.config = {
  color_config: (theme)
  show_banner: false
}

# Aliases
alias ll = ls -l
alias la = ls -la
alias v = nvim
alias g = git
alias gs = git status
alias ga = git add
alias gc = git commit
alias gp = git push
alias gl = git log
alias gd = git diff
alias .. = cd ..
alias ... = cd ../..

# Environment
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.config.show_banner = false

# Auto-start tmux on shell startup (if not already in a tmux session)
if (($env | get -o TMUX) == null) {
  # Check if tmux is installed
  if (which tmux | is-not-empty) {
    # Create session detached if it doesn't exist
    try {
      tmux new-session -d -s main -c $env.PWD
    } catch {
      # Session already exists, that's fine
    }
    # Now attach to it
    tmux attach-session -t main
  }
}
