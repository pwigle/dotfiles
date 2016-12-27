if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export PATH="$HOME/bin:/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/python"
export NODE_PATH="/usr/local/lib/node:/usr/local/share/npm/lib/node_modules"
export CLASSPATH="$HOME/lib"
export JAVA_OPTS="-Xms512m -Xmx2g"
export JAVA_HOME=$(/usr/libexec/java_home)
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=
export EDITOR=emacs
export CLICOLOR=1
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
alias gs='git status --short'
alias gemi='gem install --no-rdoc --no-ri'
alias gg='git grep'
alias gp='git pull'
alias gd='git diff'
alias ll='ls -l'

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='\u@\h \w\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\] $ '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M"
export JAVA_OPTS=$SBT_OPTS
complete -C aws_completer aws
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
