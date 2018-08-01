#Alias list by permissions
export TERM=xterm-256color

#Setup Default Editor
export EDITOR='emacs -nw'

PATH=$PATH:$HOME:~/.oh_my_bash

export CLICOLOR=1
export LSCOLORS=BxFxCxDxBxegedabagacad
#export LSCOLORS=Gxfxcxdxdxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacad

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4000
HISTFILESIZE=8000

#LLVM
export PATH="/usr/local/Cellar/llvm/6.0.0/bin:$PATH"

#source $HOME/.cargo/env

#Go Path , Go ROOT Settings
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/Users/pankajdoharey/Development/go"
export GOBIN="$GOPATH/bin"
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

#LLVM Path
export LLVM_CONFIG="/usr/local/opt/llvm/bin"

#GTK3+ Export PKGConfig
export PKG_CONFIG_PATH="/Users/pankajdoharey/gtk/inst/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/Cellar/guile/2.2.3_1/lib/pkgconfig:$PKG_CONFIG_PATH"

#GLIB 2
export PKG_CONFIG_PATH="/usr/local/Cellar/glib/2.54.3/lib/pkgconfig:$PKG_CONFIG_PATH"

#LibVTE
export PKG_CONFIG_PATH="/usr/local/Cellar/vte3/0.50.2/lib/pkgconfig:$PKG_CONFIG_PATH"

#HLA (High Level Assembler)
export HLA_HOME="$HOME/Development/hla"
export hlalib="$HLA_HOME/hlalib"
export hlainc="$HLA_HOME/include"
export hlalinkopt="-macosx_version_min 10.5.8 -weak_reference_mismatches non-weak"
export PATH="$HLA_HOME:$PATH"
export hlatemp="/tmp"

#RBENV 
eval "$(rbenv init -)"

# ANTLR
#export CLASSPATH=".:/antlr-4.7.1.jar:$CLASSPATH"
alias antlr4='java -jar $OH_MY_BASH/bin/antlr.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# OPAM config
./Users/pankajdoharey/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

#JHBUILD For GTK
export PATH="~/.local/bin:$PATH"

# Android Platform Tools
export PATH="~/Development/platform-tools/:$PATH"

#Clojure BOOT
BOOT_VERSION=2.7.2
BOOT_CLOJURE_VERSION=1.8.0
BOOT_CLOJURE_NAME=org.clojure/clojure

export PATH=/Users/pankajdoharey/.local/bin:$PATH

#GraalVM
# export GRAALVM_HOME=/Users/$(whoami)/Development/GraalVM/graalvm-1.0.0-rc1/Contents/Home
# export PATH="$GRAALVM_HOME/bin:$PATH"

#Rebar 3 Install for compiling clojerl.
export PATH=/Users/pankajdoharey/.cache/rebar3/bin:$PATH

#SCMBAG
[ -s ~/.scmbag ] && source ~/.scmbag
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/texinfo/lib"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/flex/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"


# ARM gcc-arm-none-eabi-7
export PATH="/Users/pankajdoharey/Development/gcc-arm-none-eabi-7-2018/bin:$PATH"

export PATH="/usr/local/opt/llvm/bin:$PATH"

export LDFLAGS="$LDFLAGS:-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib:-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
