if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
ssh-add $HOME/.ssh/id_rsa $HOME/.ssh/staging.pem
export PATH="$HOME/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/python"
export NODE_PATH="/usr/local/lib/node:/usr/local/share/npm/lib/node_modules"
export CLASSPATH="$HOME/lib"
export JAVA_OPTS="-Xms512m -Xmx2g"
eval "$(rbenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=emacs
export CLICOLOR=1
alias gs='git status --short'
alias gemi='gem install --no-rdoc --no-ri'
alias gg='git grep'
alias gp='git pull'
alias git='hub'
# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='\u@\h \w\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\] $ '
salt-enslave() {
    LOCAL_IP=$(ifconfig tun0 | grep "inet" | awk '{print $2}')
    ssh $1 -t "sudo sed -i 's/master: .*/master: $LOCAL_IP/' /etc/salt/minion; sudo rm /etc/salt/pki/minion/minion_master.pub; sudo service salt-minion restart"
}
salt-role() {
   ssh salt.tvoli.com -t "sudo salt -G 'role:$1' ${*:2}"
}

function curl_json() {
  out=/tmp/curl_json.json
  echo > $out $out.err $out.pretty
  curl -s -H "Content-Type: application/json" -H "Accept: application/json" $@ > $out
  jq . < $out > $out.pretty 2>$out.err
  test -s $out.err && cat $out || cat $out.pretty
  echo
}
 
function salt-tunnel() {
  ssh -R 4505:localhost:4505 -R 4506:localhost:4506 $@
}

function curl_postjs() {
 curl_json -XPOST $@
}
 
function curl_putjs() {
  curl_json -XPUT $@
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source $HOME/.credentials
export AWS_CLOUDWATCH_HOME=$HOME/tools/CloudWatch-1.0.13.4
export AWS_CLOUDFORMATION_HOME=$HOME/tools/AWSCloudFormation-1.0.12
export AWS_SNS_HOME=$HOME/tools/SimpleNotificationServiceCli-1.0.3.3
export PATH=$PATH:$AWS_CLOUDWATCH_HOME/bin:$AWS_SNS_HOME/bin:$AWS_CLOUDFORMATION_HOME/bin
export AWS_CREDENTIAL_FILE=$HOME/.aws
export EC2_REGION=eu-west-1
export AWS_REGION=$EC2_REGION
