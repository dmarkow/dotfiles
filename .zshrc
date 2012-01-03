# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="dstufft"
export ZSH_THEME="wezm+"
# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"
export EDITOR="mvim -f"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx rails3 ruby cap github brew pow rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/Cellar/python/2.7.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.oh-my-zsh/tools
export EDITOR="/usr/local/bin/mate -w"

alias sshpdx='ssh dylan@pdx01.petefowler.com'
alias sshast='ssh dylan@pdx.petefowler.com'
alias sshsc='ssh dylan@sc.petefowler.com'
alias sshco='ssh dylan@co.petefowler.com'
alias sshcol='ssh dylan@10.3.0.10'
alias gi='gem install --no-ri --no-rdoc'
alias e='mate'
alias et='e app autotest config db features lib public spec vendor/plugins Rakefile Capfile Gemfile Gemfile.lock config.ru'
#export AUTOFEATURE=true
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias devlog="tail -f log/development.log | grep -vE \"(^\s*$|asset)\""
alias redis_start='redis-server /usr/local/etc/redis.conf'
alias mongo_start='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
