function dh.deploy
	if count $argv > /dev/null
    ./ops/netdeploy/netdesign/server/app.sh default_only deploy $argv[1]
  else
    ./ops/netdeploy/netdesign/server/app.sh default_only deploy dev
  end
end
