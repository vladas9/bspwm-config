# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the prompt theme
ZSH_THEME="agnoster"

# Customize the prompt
PROMPT='%F{blue}%n%f@%F{green}%m%f %F{cyan}%~%f %# '

# Aliases
alias ls='lsd -G'
alias ll='lsd -alF'
alias la='lsd -A'
alias plr='polybar-msg cmd restart'
alias v='nvim'

# fzf
eval "$(fzf --zsh)"

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source "${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export EDITOR='nvim'
# Enable syntax highlighting
# source ~/.zsh/plugins/zsh-syntax-highlighting.plugin.zsh


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory


setopt NO_BEEP




