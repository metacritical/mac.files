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
alias ccat='highlight -O xterm256'
alias rs='rails server'
alias rc='rails c'
alias ss='script/server'
alias sc='script/console'
alias emacs="brew --prefix emacs-plus | open_brew_emacs"
alias tmux="TERM=screen-256color-bce tmux"
alias src='source ~/.bash_profile'
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
alias cljs="clj -Sdeps '{:deps {org.clojure/clojurescript {:mvn/version \"1.9.946\"}}}' -J--add-modules -Jjava.xml.bind -m cljs.repl.node"
alias cljrebl='clj -J-Dclojure.server.repl="{:port 3742 :accept clojure.core.server/repl}" -A:rebl'
alias cljsrebl="clj  -J--add-modules -Jjava.xml.bind -Sdeps '{:deps {github-mfikes/cljs-main-rebel-readline {:git/url \"https://gist.github.com/mfikes/9f13a8e3766d51dcacd352ad9e7b3d1f\" :sha \"27b82ef4b86a70afdc1a2eea3f53ed1562575519\"}}}' -i @setup.clj -m cljs.main"
alias serve="ruby -run -ehttpd . -p8000"
alias ls="ls --color"
alias less="less --RAW-CONTROL-CHARS"
alias fig="rlwrap lein figwheel"
alias csi="rlwrap csi"
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
