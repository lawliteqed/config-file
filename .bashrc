# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# User specific aliases and functions
alias ipget='curl -s http://169.254.169.254/latest/meta-data/public-hostname'
source  ~/.git-completion.bash
source ~/.rails.bash
export IP=`ipget`
export PORT=3000
export WEB_HOME='/var/www/html'
alias de='rails server -b $IP -p $PORT'
export PATH=$PATH:/usr/bin/vim/src/vim
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
alias runs='python manage.py runserver $IP:8000'

export MAVEN_HOME=~/apache-maven-3.5.0
export PATH=$PATH:$MAVEN_HOME/bin
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
