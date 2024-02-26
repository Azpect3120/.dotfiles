# vim to neovim
alias vi='nvim'
alias vim='nvim'

# add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# tmux aliases
alias tmk='tmux kill-session'
alias tmka='tmux kill-server'
alias tml='tmux list-sessions'
alias tma='tmux a'

# ls alias cuz 'la' is fucked
alias a='ls -a'

# commands manual
alias fman='compgen -c | fzf | xargs man'

# Tmux sessionizer & other keymaps
bind -x '"\C-t":~/.dotfiles/scripts/tmux-sessionizer'
bind -x '"\C-a":tmux attach-session'
