if [ -d /Users/dylan ]; then
  if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
  fi
fi
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="dstufft"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby github brew rbenv yarn)

source $ZSH/oh-my-zsh.sh
# export PROMPT='%{$fg[green]%}%m %~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '

# Customize to your needs...
# Set terminal to allow CTRL+S in vim
stty -ixon

export EDITOR=subl

export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
alias j=jump
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
alias fs="foreman start"
alias ws="yarn dev"
alias yo="yarn outdated"
alias yui="yarn upgrade-interactive"
alias yuil="yarn upgrade-interactive --latest"

alias be='bundle exec'
alias sshpdx='ssh pdx.petefowler.com'
alias sshnv='ssh nv.petefowler.com'
alias sshsc='ssh dylan@sc.petefowler.com'
alias sshscl='ssh 10.1.0.10'
alias sshec2='ssh ec2-2.petefowler.com'
alias sshdfw='ssh 10.0.0.10'
alias gi='gem install --no-document'
alias e='atom'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias l='ll'
alias df='df -h'
alias sudo='nocorrect sudo'
alias rs='bin/rails s'
alias rc='bin/rails c'
alias rdb='bin/rails db'
alias rdbu='rake db:update'
alias gg='git grep'
unalias grb
export LS_COLORS="ow=01;91:"
# Services
alias devlog="tail -f log/development.log | grep -vE \"(^\s*$|asset)\""
alias cpd="cap production deploy"
alias rdbm='rake db:migrate db:test:prepare'
alias ms='iex -S mix phx.server'
export GOPATH=$HOME/dev/go
export SOURCE_ANNOTATION_DIRECTORIES='spec'
export HOMEBREW_GITHUB_API_TOKEN=0e7939518d6818f08628f6ccea7e0234215ecb75
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="./bin:/usr/local/sbin:/usr/local/bin:$PATH:$GOPATH/bin"

alias wake_sc="wakeonlan -i 10.1.3.255 fc:aa:14:80:b3:e0"
alias wake_ks="wakeonlan -i 10.1.3.255 30:5A:3A:49:66:E4"
alias wake_cd="wakeonlan -i 10.1.3.255 54:04:a6:0c:f6:3f"
alias wake_ch="wakeonlan -i 10.1.3.255 FC:AA:14:F2:16:1D"
alias wake_mv="wakeonlan -i 10.1.3.255 FC:AA:14:80:B3:E5"
alias wake_conf="wakeonlan -i 10.1.3.255 34:13:E8:23:43:44"
alias wake_ww="wakeonlan -i 10.1.3.255 FC:AA:14:F2:16:28"
alias wake_gw="wakeonlan -i 10.1.3.255 90:2B:34:9E:7A:17"
alias wake_ew="wakeonlan -i 10.1.3.255 FC:AA:14:F2:16:0A"
alias wake_overflow2="wakeonlan -i 10.1.3.255 1C:6F:65:31:A0:9A"
alias wake_pk="wakeonlan -i 10.1.3.255 30:5A:3A:49:66:7A"

alias tunnel_ch="ssh -nNT -L 5900:10.1.1.157:5900 sc.petefowler.com"
alias tunnel_pk="ssh -nNT -L 5900:10.1.1.181:5900 sc.petefowler.com"

export PATH="$HOME/.yarn/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/dylan/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/dylan/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.zsh
export PATH="/usr/local/opt/ruby/bin:$PATH"



export VOLTA_HOME="$HOME/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"
[ -d /Users/dylan/.asdf ] && . $(brew --prefix asdf)/asdf.sh
