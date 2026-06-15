export EDITOR="nvim"
export VISUAL="nvim"
export TERM="xterm-256color"

typeset -U path PATH
path=(
  /usr/local/bin
  /opt/homebrew/bin
  "$HOME/.local/bin"
  $path
)

bindkey -v

forward-char-3() {
  zle .forward-char
  zle .forward-char
  zle .forward-char
}

backward-char-3() {
  zle .backward-char
  zle .backward-char
  zle .backward-char
}

zle -N forward-char-3
zle -N backward-char-3

# Make modified arrows behave predictably in Ghostty.
for keymap in viins vicmd; do
  bindkey -M "$keymap" '^[[1;2C' forward-char-3
  bindkey -M "$keymap" '^[[1;2D' backward-char-3
  bindkey -M "$keymap" '^[[1;5C' forward-word
  bindkey -M "$keymap" '^[[1;5D' backward-word
  bindkey -M "$keymap" '^[[1;6C' forward-word
  bindkey -M "$keymap" '^[[1;6D' backward-word
done

alias ll='ls -l'
alias la='ls -la'
alias v='nvim'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias gd='git diff'
alias ..='cd ..'
alias ...='cd ../..'
alias tmhelp='cat ~/terminal/tmux-cheatsheet.md'

for zsh_file in "$HOME/terminal"/zsh/autoload/*.zsh(N); do
  source "$zsh_file"
done

export STARSHIP_CONFIG="$HOME/terminal/starship/starship.toml"
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
