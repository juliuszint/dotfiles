export ZSH="/Users/juliuszint/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='rg --files'

if [[ -z "${NO_GNU}" ]]; then
	export PATH="${PATH}"
	export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
fi

HYPHEN_INSENSITIVE="true"

plugins=(encode64 z fzf colored-man-pages shrink-path)

source $ZSH/oh-my-zsh.sh

alias ls='/usr/local/opt/coreutils/libexec/gnubin/ls --color=auto'
alias ll='/usr/local/opt/coreutils/libexec/gnubin/ls -la --color=auto --group-directories-first'
alias ssh='TERM=xterm-256color ssh'

setopt prompt_subst
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PROMPT='%F{green}%D{%A %d.%m.%Y} %F{blue}$(shrink_path -f) %f%(!.#.$) '

# from: https://github.com/junegunn/fzf/wiki/examples#integration-with-z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
