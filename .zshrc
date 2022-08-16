# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [ -d /Users/dylan ]; then
  if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
  fi
fi
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

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
plugins=(git github brew yarn asdf docker)

source $ZSH/oh-my-zsh.sh
# export PROMPT='%{$fg[green]%}%m %~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '

# Customize to your needs...
# Set terminal to allow CTRL+S in vim
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
alias yo="yarn outdated"
alias yui="yarn upgrade-interactive"
alias yuil="yarn upgrade-interactive --latest; yarn"

alias sshnv='ssh nv.petefowler.com'
alias sshsc='ssh dylan@sc.petefowler.com'
alias sshscl='ssh 10.1.0.10'
alias sshec2='ssh ec2-2.petefowler.com'

alias gi='gem install --no-document'
alias l='ll'
alias df='df -h'
alias sudo='nocorrect sudo'
unalias grb
alias ms='iex -S mix phx.server'
export PATH="$HOME/.yarn/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
export PATH="/opt/homebrew/opt/ccache/libexec:/opt/homebrew/opt/ruby/bin:/opt/homebrew/bin:/opt/homebrew/lib/ruby/gems/3.1.0/bin/:./bin:$PATH"
export CR_PAT=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
[ -f /opt/homebrew/bin/aws_completer ] && complete -C '/opt/homebrew/bin/aws_completer' aws
function remote_shell {
  docker exec -it $(docker ps -q -l -f name=pfcs_api) bash;
}

function remote_api {
  docker exec -it $(docker ps -q -l -f name=pfcs_api) bin/api remote;
}
function remote_shell {
  docker exec -it $(docker ps -q -l -f name=pfcs_api) bash;
}

function remote_fg {
  docker exec -it $(docker ps -q -l -f name=pfcs_file-gen) bash;
}

[ -f /opt/homebrew/opt/asdf ] && . /opt/homebrew/opt/asdf
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun completions
[ -s "/Users/dylan/.bun/_bun" ] && source "/Users/dylan/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/dylan/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ccache for xcode
export CCACHE_SLOPPINESS=clang_index_store,file_stat_matches,include_file_ctime,include_file_mtime,ivfsoverlay,pch_defines,modules,system_headers,time_macros
export CCACHE_FILECLONE=true
export CCACHE_DEPEND=true
export CCACHE_INODECACHE=true



