function dh.go
	echo "commiting changes..."
  git commit -a -m "wip"
  git5 export --fix
	echo "linting..."
  and g5 lint
  #and cat /tmp/lint
  and echo "test:js_build_test_strict..."
  blaze test --nocache_test_results //ops/netdeploy/netdesign/client/test:js_build_test_strict
  #and echo "/client/test..."
  and dh.test
  #and cat /tmp/test
  and echo "deploying..."
  and dh.deploy
  #and cat /tmp/deploy
end
