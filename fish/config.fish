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
alias dh-e2e='ssh dh-e2e.dal.corp.google.com'
alias pa='prodaccess'

set MY_WORKSPACE /usr/local/google/home/spond/projects/google3 
set JAVABIN /usr/local/buildtools/java/jdk/bin/java
set E2E $MY_WORKSPACE/blaze-bin/ops/netdeploy/netdesign/e2e/e2eAll_wrapped_module
set NODE_PATH /usr/lib/node_modules:$HOME/node_modules:$E2E/node_modules:$MY_WORKSPACE/node_modules
set MYE2E $MY_WORKSPACE/ops/e2e
set MYCLIENT $MY_WORKSPACE/ops/client
set EDITOR nvim
set PATH $PATH /usr/local/bin
set PATH $PATH /usr/local/google/home/spond/projects/node_modules/.bin
#set PATH $PATH /usr/local/google/home/spond/.local/bin

function dh.e2e.train
  ./ops/netdeploy/netdesign/e2e/e2e_local_setup.sh
end

function vim.rmswap
  rm -fr /usr/local/google/home/spond/.local/share/nvim/swap/
end

function dh.e2e.green
  /google/data/ro/projects/testing/integrate/guitar_oneshot.par \
   --cluster_name=doublehelix-web-e2e -c $argv[1] -w 'doublehelix-e2e-green'
end

function dh.e2e.all
  /google/data/ro/projects/testing/integrate/guitar_oneshot.par \
  --cluster_name=doublehelix-web-e2e -c $1 -w 'doublehelix-e2e'
  --env_params="TESTTRACKER_EFFORT_ID=,TESTTRACKER_ENVIRONMENT="
end

function dh.e2e.prot
  if [ ! -d "$E2E" 
    echo "2"
    cd $MY_WORKSPACE
    blaze build ops/netdeploy/netdesign/e2e:e2eAll
    cd $E2E
    alias dh-protractor='./node /usr/local/lib/node_modules/protractor/bin/protractor node_modules/dh/conf_node.js'
  end
  if [ "$2" ]
    dh-protractor --specs=$1 --seleniumSessionId=$2
  else
    dh-protractor --specs=$1
  end
end

function sayMessage
  echo "$1"
end

function dh.reload
  ./ops/netdeploy/netdesign/server/app_local.sh stop
   rm -rf $HOME/appengine.auto.$USER
   git5 sync
   blaze clean
   dh.restart
   blaze build ops/netdeploy/netdesign/server/training/...
   blaze-bin/ops/netdesploy/netdesign/server/trainingtraining_script --env local --action create --loadmetadata --loadribbondata
end

function dh.delete.training
  if [ ! -d "blaze-bin/ops/netdeploy/netdesign/server/training" ]
    blaze build ops/netdeploy/netdesign/server/training/...
  end
  blaze-bin/ops/netdeploy/netdesign/server/training/training_script \
  --env local --action delete
end

function dh.create.training
  if [ ! -d "blaze-bin/ops/netdeploy/netdesign/server/training" ]
    blaze build ops/netdeploy/netdesign/server/training/...
  end
  blaze build ops/netdeploy/netdesign/server/training/...
  blaze-bin/ops/netdeploy/netdesign/server/training/training_script \
  --env local --action create
end

function dh.refresh.training
  dh.delete.training
  dh.create.training
end

function dh.restart
  ./ops/netdeploy/netdesign/server/app_local.sh restart
end

function dh.stop
  ./ops/netdeploy/netdesign/server/app_local.sh stop
end

function dh.full.restart
  pkill -f blaze
  blaze clean
  command ./ops/netdeploy/netdesign/server/app_local.sh
end

function dh.e2e.test.local
  if test (count $argv) --eq 2
    blaze test --nocache_test_results --notest_loasd --test_strategy=local --test_output=streamed \
    //ops/netdeploy/netdesign/e2e:$argv[1] \
    --test_arg="--params.tag=$argv[2]" \
    --test_arg="--params.username=mmpatel" \
    --test_arg="--params.enableUnicodeSearchStrategy=true"
  else
    blaze test --nocache_test_results --notest_loasd --test_strategy=local --test_output=streamed --test_timeout=3600 \
    //ops/netdeploy/netdesign/e2e:$argv[1] \
    --test_arg="--params.username=mmpatel" \
    --test_arg="--params.enableUnicodeSearchStrategy=true"
  end
end

function dh.e2e.guitar
  /google/data/ro/projects/testing/integrate/guitar_oneshot.par \
    --cluster_name=doublehelix-web-e2e -c $argv[1] -w 'doublehelix-e2e'
end

function dh.e2e.guitar.local
  /google/data/ro/projects/testing/integrate/local_guitar.par \
  --config_file=ops/netdeploy/netdesign/e2e/guitar/dh_e2e_green.itcnf \
  --override_all_client_specs \
  --env_params="TESTTRACKER_EFFORT_ID=,TESTTRACKER_ENVIRONMENT="
end

function dh.e2e.forge
  if [ "$2" ]
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
  end
end

function dh.e2e.forge.streamed
  if count $argv == 2
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
  end
end

function dh.start
  #cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh
end

function dh.start.hermetic
  #cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh start --storage_path=/tmp/appengine.auto.hermetic
end

function dh.start
  #cd $MY_WORKSPACE
  ops/netdeploy/netdesign/server/app_local.sh
end

function dh.start.cns
  ops/netdeploy/netdesign/server/app_local.sh --storage_path=appengine.auto.hermetic
end

function dh.strict
  iblaze test --nocache_test_results //ops/netdeploy/netdesign/client/test:js_build_test_strict
end

function dh.test
  blaze test //ops/netdeploy/netdesign/client/test:test
end

function dh.deploy
  if count $argv > /dev/null
    ./ops/netdeploy/netdesign/server/app.sh default_only deploy $argv[0]
  else
    ./ops/netdeploy/netdesign/server/app.sh default_only deploy dev
  end
end

function dh.karma
  iblaze run ops/netdeploy/netdesign/client/test:all_unit_local
end

function dh.import
  cd $MY_WORKSPACE
  ./ops/netdeploy/netdesign/server/init_local.sh --source=dev --tables $1 --search $1
end
