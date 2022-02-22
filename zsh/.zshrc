export ZSH="/home/julius/.oh-my-zsh"
export RIPGREP_CONFIG_PATH="/home/julius/.config/rgrc"

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

export FZF_DEFAULT_COMMAND='rg --files --no-config'
export HYPHEN_INSENSITIVE="true"
export MOZ_ENABLE_WAYLAND=1
export TERM=xterm-256color
export PATH="/home/julius/.local/bin:$PATH"

plugins=(encode64 z fzf)
source $ZSH/oh-my-zsh.sh

alias ll='ls -lh --color=auto --group-directories-first'
alias vim='nvim'
alias gvim='nvim-qt'

function open() {
	nohup xdg-open "$*" > /dev/null 2>&1
}

# combines z and fzf so if z does not find a single match it calls
# fzf with all the options
# from: https://github.com/junegunn/fzf/wiki/examples#integration-with-z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

PROMPT='%F{green}%D{%A %d.%m.%Y} %F{blue}%0d %(?..%F{red}[%?])%f%(!.#.$) '
