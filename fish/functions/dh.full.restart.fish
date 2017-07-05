function dh.full.restart
	pkill -f blaze
  blaze clean
  command ./ops/netdeploy/netdesign/server/app_local.sh
end
