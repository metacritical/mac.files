#Alias list by permissions
export TERM=xterm-256color

#Setup Default Editor
export EDITOR='emacsclient -nw'

PATH=$PATH:$HOME:~/.oh_my_bash

export CLICOLOR=1
#export LSCOLORS='BxFxCxDxBxegedabagacad'
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4000
HISTFILESIZE=8000

export TERM="xterm-color"


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"

#LLVM
export PATH="/usr/local/opt/llvm\@3.9/bin:$PATH"

source $HOME/.cargo/env

#Go Path , Go ROOT Settings
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/Users/pankajdoharey/Development/go"
export PATH="$GOPATH/bin:$PATH"

#Custom Scipts Folder
export OH_MY_BASH=$HOME/.oh_my_bash

#Bash Scripts Includer
source $OH_MY_BASH/includer.sh

#BASH Prompt
source $BASH_LIBS/prompt.sh

#Google API KEY "NO" for chromium
export GOOGLE_API_KEY="no"
export GOOGLE_DEFAULT_CLIENT_ID="no"
export GOOGLE_DEFAULT_CLIENT_SECRET="no"

if [ "$TERM" = dumb ] && [ "$INSIDE_EMACS" ]; then
    export TERM=dumb-emacs-ansi COLORTERM=1
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/opt/sqlite/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#SCM Breeze
[ -s "/Users/pankajdoharey/.scm_breeze/scm_breeze.sh" ] && source "/Users/pankajdoharey/.scm_breeze/scm_breeze.sh"

export PATH=$PATH:~/.nexustools
