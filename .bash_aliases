# vim to neovim
alias vim="nvim"
alias vi="nvim"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# commands manual
alias fman='compgen -c | fzf | xargs man'

# Funny vim aliases
# alias v='fd --type f --hidden --exclude .git --exclude /node_modules | fzf-tmux -p | xargs nvim'
alias v='nvim .'

# Source the .bashrc file
alias sb="source $HOME/.bashrc"

# Replace LS with eza
alias ls="eza --icons=always --group-directories-first -X"
alias la="eza --icons=always --group-directories-first -aX"
alias ll="eza --icons=always --group-directories-first -lX --git"
alias lla="eza --icons=always --group-directories-first -laX --git"
alias lt="eza --icons=always --group-directories-first -XTL 2"

# Using fzf for history
function h() {
  eval $(history | awk '{for (i=4; i<=NF; i++) printf "%s ", $i; printf "\n"}' | \
    fzf -e --tac --border --border-label='History' --margin='2%')
}
alias h="h"

# Use bat instead of cat
alias cat="bat"

# Use rip instead of rm
alias rm="rip"

# Setup fuck
eval "$(thefuck --alias)"
