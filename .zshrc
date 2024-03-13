# Set the prompt theme
ZSH_THEME="agnoster"

# Customize the prompt
PROMPT='%F{blue}%n%f@%F{green}%m%f %F{cyan}%~%f %# '

# Aliases
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias plr='polybar-msg cmd restart'

# Enable syntax highlighting
# source ~/.zsh/plugins/zsh-syntax-highlighting.plugin.zsh

# Set LS_COLORS
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;44:cd=33;44:su=31;41:sg=31;46:tw=31;42:ow=34;42'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

setopt NO_BEEP
