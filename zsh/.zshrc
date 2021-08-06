export ZSH="/home/juliuszint/.oh-my-zsh"

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export FZF_DEFAULT_COMMAND='rg --files'
export HYPHEN_INSENSITIVE="true"
export MOZ_ENABLE_WAYLAND=1
export TERM=xterm-256color

plugins=(encode64 z fzf colored-man-pages shrink-path)
source $ZSH/oh-my-zsh.sh

alias ll='ls -lah --color=auto --group-directories-first'

# combines z and fzf so if z does not find a single match it calls
# fzf with all the options
# from: https://github.com/junegunn/fzf/wiki/examples#integration-with-z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

PROMPT='%F{green}%D{%A %d.%m.%Y} %F{blue}$(shrink_path -f) %f%(!.#.$) '
