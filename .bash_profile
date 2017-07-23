if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

LS_COMMON="-hp --color=auto"
LS_COMMON="$LS_COMMON -I \\\$RECYCLE.BIN"
LS_COMMON="$LS_COMMON -I System\ Volume\ Information"
VIMEXE='C:\Program Files (x86)\Vim\vim80\gvim.exe'

function _filecomplete_()
{
    local word=${COMP_WORDS[COMP_CWORD]}
    local directory=(*)
    local filesOnly=()
    local matchedFiles=()

    for i in "${directory[@]}"
    do
        if [ -f "$i" ]
        then
            filesOnly+=("$i")
        fi
    done

    if [[ -z "$word" ]] ;
    then
        COMPREPLY=("${filesOnly[@]}")
    else
        for var in "${filesOnly[@]}"
        do
            if [[ ${var,,} == ${word,,}* ]] ;
            then
                local escaped=$(printf %q "$var")
                matchedFiles+=("$escaped")
            fi
        done
        COMPREPLY=("${matchedFiles[@]}")
    fi
}

startvim()
{
	DIDSTART='false'
	if ! tasklist | grep -q gvim.exe
	then
		explorer "$VIMEXE"
		sleep 0.1
		DIDSTART='true'
	fi
	gvim.exe --remote $1

	if [ $DIDSTART = 'true' ]; then
		gvim.exe --remote-send ":cd %:p:h<CR>"
	fi
}

alias ls="ls $LS_COMMON"
alias lf="ls -la $LS_COMMON"
alias open="explorer $1"
alias gvim="startvim $1"

complete -F _filecomplete_ open

PS1="\[\033[0;32m\]\u@\h \[\033[0m\]\W\[\033[0m\] \$ "

if [ -d "/n" ]; then
    cd /n
	ll
else
    cd ~/Documents
fi

set -o vi
