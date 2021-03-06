if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

alias c="clear"
alias h="cd ~/"
alias hc="cd ~/ && clear"
alias back="cd $OLDPWD"
alias ls="ls --color=auto"

alias .="cd ../"
alias ..="cd ../../"
alias ...="cd ../../../"

alias update="sudo apt-get update && sudo apt-get upgrade -y"

alias edit="nano ~/.bashrc ; source ~.bashrc"
alias reload="source ~/.bashrc"

alias art="php artisan"

gitup() {
    git add .
    git commit -m "$1"
    git push -u origin master
}

extract () {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

s() {
    if [[ $# == 0 ]]; then
    	sudo $(history -p '!!')
    else
    	sudo "$@"
    fi
}

up() {
    local path i
    for (( i=0; i < $1; i++ )); do
        path+=../
    done
    cd "$path"
}

function pdfman() {
    man -t $@ | pstopdf -i -o /tmp/$1.pdf && open /tmp/$1.pdf
}
