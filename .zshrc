# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="simple"
# ZSH_THEME="random"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx rails3 ruby cap github brew pow rbenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# Set terminal to allow CTRL+S in vim
stty -ixon

export EDITOR=vim

# Aliases
alias sshpdx='sshec2'
alias sshast='ssh dylan@pdx.petefowler.com'
alias sshsc='ssh dylan@sc.petefowler.com'
alias sshco='ssh dylan@co.petefowler.com'
alias sshcol='ssh dylan@10.3.0.10'
alias sshbackup='ssh 10.2.0.11'
alias sshec2='ssh -i ~/Dropbox/dmarkow.pem ec2.petefowler.com'
alias gi='gem install --no-ri --no-rdoc'
alias e='subl'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias l='ll'
alias df='df -h'
alias sudo='nocorrect sudo'
alias rs='bin/rails s'
alias rc='bin/rails c'
alias rdb='bin/rails db'
export LS_COLORS="ow=01;91:"
# Services
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias devlog="tail -f log/development.log | grep -vE \"(^\s*$|asset)\""
alias redis_start='redis-server /usr/local/etc/redis.conf'
alias mongo_start='mongod run --config /usr/local/Cellar/mongodb/2.0.3-x86_64/mongod.conf'
alias rdbm='rake db:migrate db:test:clone_structure'
export PATH=$HOME/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/Cellar/python/2.7.3/bin:/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.oh-my-zsh/tools
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:/Applications/Vagrant/bin:$PATH"
export PATH="./bin:$PATH"
