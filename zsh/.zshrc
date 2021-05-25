export HISTFILE="~/.config/zsh/zsh_history"
export EDITOR="nvim"
export TERMINAL="Alacritty"
export BROWSER="librewolf"
export MANPAGER="bat"

alias news="newsboat"
alias nf="neofetch"
alias ka="killall"
alias clean="paru -c"
alias cl="clear"
alias vim="nvim"
alias vi="nvim"
alias ..="cd .."
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias zshrc="nvim ~/.config/zsh/.zshrc"
alias yarn="yarn --use-yarnrc /home/celeste/.config/yarn/yarnrc"

SAVEHIST=1000
HISTSIZE=1000

source ~/.config/zsh/.zinit/bin/zinit.zsh
#plugins!
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-history-substring-search
zinit load ael-code/zsh-colored-man-pages

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="paru *"

autoload -U compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)		# Include hidden files.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

[ -f "$HOME/.config/env" ] && source "$HOME/.config/env"

[ -f ~/.local/share/fzf.zsh ] && source ~/.local/share/fzf.zsh

eval "$(starship init zsh)"
source ~/.local/share/icons-in-terminal/icons_bash.sh

export SDKMAN_DIR="/home/celeste/.sdkman"
[[ -s "/home/celeste/.sdkman/bin/sdkman-init.sh" ]] && source "/home/celeste/.sdkman/bin/sdkman-init.sh"
