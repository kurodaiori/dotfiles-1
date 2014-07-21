
case "$(uname)" in
    Darwin )
        # reflesh $PATH on tmux
        [ -f /etc/profile ] && PATH="" && source /etc/profile

        #terminal
        export CLICOLOR=1
        export LSCOLORS=ExFxCxDxBxegedabagacad

        # rlwrap
        alias sqlplus="rlwrap sqlplus"
        alias smbclient="rlwrap smbclient"
        alias telnet="rlwrap telnet"
        alias screen="rlwrap screen"

        # mutt
        alias mutt="LC_ALL= LC_MESSAGES=C mutt"

        #completion
        if [ -f `brew --prefix`/etc/bash_completion ]; then
            . `brew --prefix`/etc/bash_completion
        fi

        #git completion
        if [ -f `brew --prefix git`/etc/bash_completion.d/git-completion.bash ]; then
            . `brew --prefix git`/etc/bash_completion.d/git-completion.bash
        fi
        if [ -f `brew --prefix git`/etc/bash_completion.d/git-prompt.sh ]; then
            . `brew --prefix git`/etc/bash_completion.d/git-prompt.sh
        fi

        # Mac2Mac ssh 
        export LANG=ja_JP.UTF-8

        #brew env
        export PATH=`brew --prefix`/bin:$PATH
        export PATH=`brew --prefix`/sbin:$PATH
        export PATH=`brew --prefix`/share/python:$PATH
        export PATH=`brew --prefix python`/bin:$PATH

        export LC_CTYPE=ja_JP.UTF-8
        export LC_ALL=ja_JP.UTF-8

        if [ -d "$HOME/.cabal/bin" ]; then
            export PATH="$HOME/.cabal/bin:$PATH"
        fi

        if [ -d "/usr/local/share/npm/bin" ]; then
            export PATH="/usr/local/share/npm/bin":$PATH
        fi

        export GOPATH="$HOME/mygo"
        export PATH="$PATH:$GOPATH/bin"
    ;;
esac

export EDITOR=vim

export PATH=~/bin:$PATH # user scripts
export VTE_CJK_WIDTH=1 #ambiwidth

# bash history settings
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:ls*:pwd*:cd*:history*:exit"
export HISTSIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

export IGNOREEOF=3

# show current branch.
PS1='\[\e[0m\]\u:\h \W$(__git_ps1 "[%s]" 2>/dev/null)\$ ';

# insert escape char on gnu screen sessions.
[[ $TERM = screen* ]] && [ -z "$TMUX" ] && PS1="`printf '\[\033k\033\134\134\]'`$PS1"

#php
if [ -f $HOME/.phpenv/bin/phpenv ]; then
	export PATH=$PATH:$HOME/.phpenv/bin
	eval "$(phpenv init -)"
fi

for e in pl py rb; do
	type -P "$e" >/dev/null && eval "$("$e"env init -)"
done

rehash () {
	plenv rehash
	pyenv rehash
	rbenv rehash
}

#go
[ -f $HOME/.gvm/scripts/gvm ] && . $HOME/.gvm/scripts/gvm
