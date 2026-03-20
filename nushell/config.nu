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
