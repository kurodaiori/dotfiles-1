#terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#oracle
export ORACLE_HOME=$HOME/Oracle/instantclient_10_2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
export DYLD_LIBRARY_PATH="$ORACLE_HOME:$DYLD_LIBRARY_PATH"
export DYLIB_LIBRARY_PATH=$ORACLE_HOME
export TNS_ADMIN=$ORACLE_HOME
export PATH=$ORACLE_HOME:$PATH
export NLS_LANG=Japanese_Japan.UTF8
export SQLPATH=$ORACLE_HOME
alias sqlplus="rlwrap sqlplus"

#smbclient
alias smbclient="rlwrap smbclient"

#completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# user scripts
export PATH=~/bin:$PATH

# bash history settings
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd*:history*"
export HISTSIZE=10000
shopt -s histappend
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r;"

#ambiwidth
export VTE_CJK_WIDTH=1

#git completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
    PS1='\u:\h \W$(__git_ps1 "[%s]")\$ ';
fi

#screen
PS1='\[\033k\033\134\]'$PS1
#alias screen="screen -U"

# Mac2Mac ssh 
export LANG=ja_JP.UTF-8

#brew env
export PATH=`brew --prefix`/bin:$PATH
export PATH=`brew --prefix`/sbin:$PATH
export PATH=`brew --prefix`/share/python:$PATH
export PATH=`brew --prefix python`/bin:$PATH

#cpanm
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$PATH:~/perl5/bin
export PERL5LIB=$PERL5LIB:~/perl5/lib/perl5
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi

#python
export WORKON_HOME=$HOME/.virtualenvs
source `which virtualenvwrapper.sh`
