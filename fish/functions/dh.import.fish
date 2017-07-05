function dh.import
	./ops/netdeploy/netdesign/server/init_local.sh --source=prod --tables $argv[1] --search $argv[1]
end
