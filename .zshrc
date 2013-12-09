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
plugins=(git osx rails ruby cap github brew rbenv)

source $ZSH/oh-my-zsh.sh
export PROMPT='%{$fg[green]%}%m %~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '

# Customize to your needs...
# Set terminal to allow CTRL+S in vim
stty -ixon

export EDITOR=vim

export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# Aliases
alias be='bundle exec'
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
alias rdbu='rake db:update'
export LS_COLORS="ow=01;91:"
# Services
alias devlog="tail -f log/development.log | grep -vE \"(^\s*$|asset)\""
alias cpd="cap production deploy"
alias rdbm='rake db:migrate db:test:clone_structure'
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$HOME/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.oh-my-zsh/tools
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:/Applications/Vagrant/bin:$PATH"
export PATH="./bin:$PATH"
