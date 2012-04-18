case "$(uname)" in
    Darwin )
        #terminal
        export CLICOLOR=1
        export LSCOLORS=ExFxCxDxBxegedabagacad

        #oracle
        export ORACLE_HOME="$HOME/Oracle/instantclient_10_2"
        export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ORACLE_HOME"
        export DYLD_LIBRARY_PATH="$ORACLE_HOME:$DYLD_LIBRARY_PATH"
        export DYLIB_LIBRARY_PATH="$ORACLE_HOME"
        export TNS_ADMIN="$ORACLE_HOME"
        export PATH="$ORACLE_HOME:$PATH"
        export NLS_LANG=Japanese_Japan.UTF8
        export SQLPATH="$ORACLE_HOME"
		export VERSIONER_PERL_PREFER_32_BIT=yes

        # rlwrap
        alias sqlplus="rlwrap sqlplus"
        alias smbclient="rlwrap smbclient"
        alias telnet="rlwrap telnet"

        #completion
        if [ -f `brew --prefix`/etc/bash_completion ]; then
            . `brew --prefix`/etc/bash_completion
        fi

        #git completion
        if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
            . `brew --prefix`/etc/bash_completion.d/git-completion.bash
        fi

        # Mac2Mac ssh 
        export LANG=ja_JP.UTF-8

        #brew env
        export PATH=`brew --prefix`/bin:$PATH
        export PATH=`brew --prefix`/sbin:$PATH
        export PATH=`brew --prefix`/share/python:$PATH
        export PATH=`brew --prefix python`/bin:$PATH
    ;;
esac

export PATH=~/bin:$PATH # user scripts
export VTE_CJK_WIDTH=1 #ambiwidth

# bash history settings
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:cd*:history*"
export HISTSIZE=10000
shopt -s histappend
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r;"

# show current branch.
type __git_ps1 >/dev/null 2>&1 && PS1='\u:\h \W$(__git_ps1 "[%s]")\$ ';

PS1="`printf '\[\033k\033\134\134\]'`$PS1"  #screen

#cpanm
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$PATH:~/perl5/bin
export PERL5LIB=$PERL5LIB:~/perl5/lib/perl5
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi

#python
export WORKON_HOME=$HOME/.virtualenvs
if [ -f "`type -P virtualenvwrapper.sh`" ]; then
    source `type -P virtualenvwrapper.sh`
fi

#ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

