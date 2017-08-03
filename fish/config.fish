source /google/data/ro/teams/fish/google.fish
source ~/.config/fish/nvm-wrapper/nvm.fish

nvm use stable

alias vi=nvim
alias wip='git commit -m "wip"'
alias g5=git5
alias mux=tmuxinator
alias goo='mux goo'
alias goo.restart='mux stop goo; mux goo'
alias restart.network='sudo service network-manager stop; and sudo killall wpa_supplicant; and sudo service network-manager start'
alias restart.remote='/etc/init.d/chrome-remote-desktop restart'
alias pa='prodaccess'

set MY_WORKSPACE /usr/local/google/home/spond/projects/google3 
set JAVABIN /usr/local/buildtools/java/jdk/bin/java
set E2E $MY_WORKSPACE/blaze-bin/ops/netdeploy/netdesign/e2e/e2eAll_wrapped_module
set NODE_PATH /usr/lib/node_modules:$HOME/node_modules:$E2E/node_modules:$MY_WORKSPACE/node_modules
set MYE2E $MY_WORKSPACE/ops/e2e
set MYCLIENT $MY_WORKSPACE/ops/netdeploy/netdesign/client
set EDITOR nvim
set PATH $PATH /usr/local/bin
set PATH $PATH /usr/local/google/home/spond/projects/node_modules/.bin
set PATH $PATH /usr/local/google/home/spond/bin
set PATH $PATH /usr/local/google/home/spond/.nvm/versions/node/v7.7.0/bin
set TERM screen-256color
