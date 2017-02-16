#Path to yor oh-my-zsh installation.  
export ZSH=$HOME/.oh-my-zsh

MY_WORKSPACE=/usr/local/google/home/spond/projects/google3
MY_WORKSPACE_CLIENT=/usr/local/google/home/spond/projects/google3/ops/netdeploy/netdesign/client
E2E=$MY_WORKSPACE/blaze-bin/ops/netdeploy/netdesign/e2e/e2eAll_wrapped_module

JAVABIN=/usr/local/buildtools/java/jdk/bin/java
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias g5diff='git difftool --tool=meld $(git5 status --base)'
alias wip='git commit -m "wip"'
alias WIP='git add .; git commit -m "wip"'
alias g5uds='git5 diff --uncommitted | diffstat'
alias pa='prodaccess'
alias dh.e2esetup='./ops/netdeploy/netdesign/e2e/e2e_setup.sh'
export E2E=$MY_WORKSPACE/blaze-bin/ops/netdeploy/netdesign/e2e/e2eAll_wrapped_module
export NODE_PATH=/usr/lib/node_modules:$HOME/node_modules:$E2E/node_modules:$MY_WORKSPACE/node_modules
export MYE2E=$MY_WORKSPACE/ops/e2e
export MYCLIENT=$MY_WORKSPACE/ops/client
export EDITOR=nvim
alias g5='git5'
alias er='dh.e2e.prot e2eRackView'
alias vi=nvim
alias goo='tmux -2 new-session -A -s goo'
alias restart_network='sudo service network-manager stop && sudo killall wpa_supplicant && sudo service network-manager start'
alias restart_remote='/etc/init.d/chrome-remote-desktop restart'
alias dh-e2e='ssh dh-e2e.dal.corp.google.com'

function dh.e2e.train {
  ./ops/netdeploy/netdesign/e2e/e2e_local_setup.sh
}

function vim.rmswap {
  rm -fr /usr/local/google/home/spond/.local/share/nvim/swap/
}

function dh.e2e.green {
  /google/data/ro/projects/testing/integrate/guitar_oneshot.par \
   --cluster_name=doublehelix-web-e2e -c $1 -w 'doublehelix-e2e-green'
}

function dh.e2e.all {
/google/data/ro/projects/testing/integrate/guitar_oneshot.par \
--cluster_name=doublehelix-web-e2e -c $1 -w 'doublehelix-e2e'
--env_params="TESTTRACKER_EFFORT_ID=,TESTTRACKER_ENVIRONMENT="
}

function dh.e2e.prot {
  if [ ! -d "$E2E" ] ; then
    echo "2"
    cd $MY_WORKSPACE
    blaze build ops/netdeploy/netdesign/e2e:e2eAll
  fi
  cd $E2E
  alias dh-protractor='./node /usr/local/lib/node_modules/protractor/bin/protractor node_modules/dh/conf_node.js'
  if [ "$2" ]
  then
    dh-protractor --specs=$1 --seleniumSessionId=$2
  else
    dh-protractor --specs=$1
  fi
}

sayMessage() {
    echo "$(tput setaf 4)$(tput bold)$1$(tput sgr0)"
}

function dh.reload {
  ./ops/netdeploy/netdesign/server/app_local.sh stop
   rm -rf $HOME/appengine.auto.$USER
   git5 sync
   blaze clean
   dh.restart
   blaze build ops/netdeploy/netdesign/server/training/...
   blaze-bin/ops/netdesploy/netdesign/server/trainingtraining_script --env local --action create --loadmetadata --loadribbondata
}

function dh.delete.training {
  if [ ! -d "blaze-bin/ops/netdeploy/netdesign/server/training" ]; then
    blaze build ops/netdeploy/netdesign/server/training/...
  fi
  blaze-bin/ops/netdeploy/netdesign/server/training/training_script \
  --env local --action delete
}

function dh.create.training {
  if [ ! -d "blaze-bin/ops/netdeploy/netdesign/server/training" ]; then
    blaze build ops/netdeploy/netdesign/server/training/...
  fi
  blaze build ops/netdeploy/netdesign/server/training/...
  blaze-bin/ops/netdeploy/netdesign/server/training/training_script \
  --env local --action create
}

function dh.refresh.training {
  dh.delete.training
  dh.create.training
}

function stop {
  ./ops/netdeploy/netdesign/server/app_local.sh stop
}

function dh.restart {
#  cd $MY_WORKSPACE
  ./ops/netdeploy/netdesign/server/app_local.sh restart
  # supply chain only
  #  --use_internal_app_identity
}

function dh.stop {
#  cd $MY_WORKSPACE
  ./ops/netdeploy/netdesign/server/app_local.sh stop
}

function dh.full.restart {
  pkill -f blaze
  blaze clean
  ops/netdeploy/netdesign/server/app_local.sh
}

function dh.e2e.test.local {
  if [ "$2" ]
  then
    blaze test --nocache_test_results --notest_loasd --test_strategy=local --test_output=streamed \
    //ops/netdeploy/netdesign/e2e:$1 \
    --test_arg="--params.tag=$2" \
    --test_arg="--params.username=mmpatel" \
    --test_arg="--params.enableUnicodeSearchStrategy=true"
  else
    blaze test --nocache_test_results --notest_loasd --test_strategy=local --test_output=streamed --test_timeout=3600 \
    //ops/netdeploy/netdesign/e2e:$1 \
    --test_arg="--params.username=mmpatel" \
    --test_arg="--params.enableUnicodeSearchStrategy=true"
  fi
}

function dh.e2e.guitar {
  /google/data/ro/projects/testing/integrate/guitar_oneshot.par \
    --cluster_name=doublehelix-web-e2e -c $1 -w 'doublehelix-e2e'
}

function dh.e2e.guitar.local {
  /google/data/ro/projects/testing/integrate/local_guitar.par \
  --config_file=ops/netdeploy/netdesign/e2e/guitar/dh_e2e_green.itcnf \
  --override_all_client_specs \
  --env_params="TESTTRACKER_EFFORT_ID=,TESTTRACKER_ENVIRONMENT="
}

function dh.e2e.forge {
  if [ "$2" ]
  then
    blaze test --nocache_test_results --test_timeout=3600 \
      //ops/netdeploy/netdesign/e2e:$1 \
      --test_arg="--params.tag=$2" \
      --test_arg="--params.username=mpatel" \
      --test_arg="--params.enableUnicodeSearchStrategy=true" \
      --test_arg="--params.isTrainingDataSetup=true" \
      --test_arg="--params.isLaunchServerEnabled=true"
  else
    blaze test --nocache_test_results --test_timeout=3600 \
      //ops/netdeploy/netdesign/e2e:$1 \
      --test_arg="--params.isLaunchServerEnabled=true"
  fi
}

function dh.e2e.forge.streamed {
  if [ "$2" ]
  then
    blaze test --nocache_test_results --test_timeout=15000 --test_output=streamed \
      //ops/netdeploy/netdesign/e2e:$1 \
      --test_arg="--params.tag=$2" \
      --test_arg="--params.username=mmpatel" \
      --test_arg="--params.isLaunchServerEnabled=true"
  else
    blaze test --nocache_test_results --test_timeout=15000 --test_output=streamed \
      //ops/netdeploy/netdesign/e2e:$1 \
      --test_arg="--params.username=mmpatel" \
      --test_arg="--params.isLaunchServerEnabled=true"
  fi
}

function dh.start {
  #cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh
}

function dh.start.hermetic {
  #cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh start --storage_path=/tmp/appengine.auto.hermetic
}

function dh.start {
  #cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh
}

function dh.start.cns {
  ops/netdeploy/netdesign/server/app_local.sh --storage_path=appengine.auto.hermetic
}

function dh.start.compressed {
  cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh
}

function dh.strict {
#  cd $MY_WORKSPACE
  iblaze test --nocache_test_results //ops/netdeploy/netdesign/client/test:js_build_test_strict
}

function dh.strict.plain {
#  cd $MY_WORKSPACE
  blaze test --test_output=all //ops/netdeploy/netdesign/client/test:js_build_test_strict
}

function dh.js {
  cd $MY_WORKSPACE
  blaze build --test_output=all //ops/netdeploy/netdesign/client/js:js
}

function dh.test {
#  cd $MY_WORKSPACE
  blaze test //ops/netdeploy/netdesign/client/test:test
}

function dh.deploy {
  #cd $MY_WORKSPACE
  if [ "$1" ]
  then
    ./ops/netdeploy/netdesign/server/app.sh default_only deploy $1
  else
    ./ops/netdeploy/netdesign/server/app.sh default_only deploy dev
  fi
}

function dh.deploy.full {
  cd $MY_WORKSPACE
  if [ "$1" ]
  then
    ./ops/netdeploy/netdesign/server/app.sh deploy $1
  else
    ./ops/netdeploy/netdesign/server/app.sh deploy dev
  fi
}

function dh.karma {
  #cd $MY_WORKSPACE
  iblaze run ops/netdeploy/netdesign/client/test:all_unit_local
}

function dh_import {
  cd $MY_WORKSPACE
  ./ops/netdeploy/netdesign/server/init_local.sh --source=dev --tables $1 --search $1
}

function dh_lint {
  cd $MY_WORKSPACE
  ops/netdeploy/netdesign/client/gjslint.sh
}
source /etc/bash_completion.d/g4d

# Use graphical diffing tools when they're available

if [ -n "$DISPLAY" ] ; then
  export G4MULTIDIFF=1
  export P4DIFF='bash -c "meld \${@/#:/--diff}" padding-to-occupy-argv0'
  export P4MERGE='bash -c "meld \$2 \$1 \$3 ; cp \$1 \$4" padding-to-occupy-argv0'
else
  export P4DIFF="/google/src/files/head/depot/google3/devtools/scripts/p4diff -w"
  export P4MERGE=/home/build/public/eng/perforce/mergep4.tcl
fi
export PATH=$PATH:/home/spond



#fixes falling off vlan issue
alias restart_network='sudo service network-manager stop && sudo killall wpa_supplicant && sudo service network-manager start'


export POWERLINE_CONFIG_COMMAND='/usr/local/google/home/spond/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf'

#if [[ -r /usr/local/google/home/spond/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
  #source /usr/local/google/home/spond/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

eval `dircolors /usr/local/google/home/spond/dircolors-solarized/dircolors.256dark`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_POWERLINE_SHOW_IP=true     # Display current IP in the prompt

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/google/home/spond/.local/bin:$HOME/usr/local/lib/node_modules/
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

#RUNTIME=/usr/local/google/home/spond/projects/google3/blaze-bin/ops/netdeploy/netdesign/server/local.runfiles


export PATH=$PATH:/usr/local/google/home/spond
