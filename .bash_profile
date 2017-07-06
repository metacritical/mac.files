#Alias list by permissions
export TERM=screen-256color

#Setup Default Editor
export EDITOR='emacsclient -nw'

PATH=$PATH:$HOME:~/.oh_my_bash

export CLICOLOR=1
#export LSCOLORS='BxFxCxDxBxegedabagacad'
export LSCOLORS='Gxfxcxdxdxegedabagacad'

#Custom Scipts Folder
export OH_MY_BASH=$HOME/.oh_my_bash

#Bash Scripts Includer
source $OH_MY_BASH/includer.sh

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4000
HISTFILESIZE=8000

export TERM="xterm-color"
alias ls="ls -G"

[ -s "/Users/pankajdoharey/.scm_breeze/scm_breeze.sh" ] && source "/Users/pankajdoharey/.scm_breeze/scm_breeze.sh"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

source $HOME/.cargo/env

#Go Path , Go ROOT Settings
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/Users/pankajdoharey/Development/go"
export PATH="$GOPATH/bin:$PATH"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias aws_connect="ssh -i ~/.ssh/MyKeyPairpem.pem ubuntu@54.169.238.96"
alias cljs="java -cp ~/.cljs/cljs.jar:src clojure.main"export PATH="/usr/local/opt/sqlite/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$PATH:$HOME/.rvm/bin"


export PS1='$(pwd) \n\@ $(gitstats status)> '

