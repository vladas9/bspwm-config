# Set the prompt theme
ZSH_THEME="agnoster"

# Customize the prompt
PROMPT='%F{blue}%n%f@%F{green}%m%f %F{cyan}%~%f %# '

# Aliases
alias ls='lsd -G'
alias ll='lsd -alF'
alias la='lsd -A'
alias plr='polybar-msg cmd restart'

# fzf
eval "$(fzf --zsh)"


export EDITOR='nvim'
# Enable syntax highlighting
# source ~/.zsh/plugins/zsh-syntax-highlighting.plugin.zsh


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

setopt NO_BEEP

