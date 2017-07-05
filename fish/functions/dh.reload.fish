function dh.reload
	./ops/netdeploy/netdesign/server/app_local.sh stop
   rm -rf $HOME/appengine.auto.$USER
#   git5 sync
   blaze clean
   dh.restart
   blaze build ops/netdeploy/netdesign/server/training/...
   blaze-bin/ops/netdeploy/netdesign/server/training/training_script --env local --action create --loadmetadata --loadribbondata
end
