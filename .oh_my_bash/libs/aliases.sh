#Alias List by permissions
alias _='sudo'
#alias l='ls -CF --color=auto'
#alias ls='ls --color=auto'
#alias la='ls -A --color=auto'
alias lsv='ls -v --color=auto'
alias lsd='ls -l --color=auto'
#alias ll='ls -alF --color=auto'
alias db:c='rake db:create'
alias db:m='rake db:migrate'
alias db:d='rake db:drop'
alias db:seed='rake db:seed'
alias db:s='rake db:setup'
alias db:r='rake db:migrate:redo'
alias rmrf='rm -rf'
alias ccat='pygmentize'
alias rs='rails server'
alias rc='rails c'
alias ss='script/server'
alias sc='script/console'
alias emacs="brew info 'emacs' | sed -n 6p | open_brew_emacs"
alias tmux="TERM=screen-256color-bce tmux"
alias src='source ~/.bashrc'
alias sbts='a=$(pwd);cd $a'
#alias rm='rm -i'
alias :q='exit 0'
alias :Q='exit 0'
alias jira_pass='cat ~/Documents/creds.txt | xclip -i -selection clipboard'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias rgrep='grep --color=auto -r -n2 '
alias cd~='cd ~'
alias cd.='cd ..'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias clj="java -cp $OH_MY_BASH/bin/clojure-1.8.0.jar clojure.main"
alias cljs="java -cp $OH_MY_BASH/bin/cljs.jar:src clojure.main"
alias serve="ruby -run -ehttpd . -p8000"
alias ls="ls -G"
