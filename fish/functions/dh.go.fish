function dh.go
	echo "linting..."
  g5 lint > /tmp/lint
  and cat /tmp/lint
  and echo "test:js_build_test_strict..."
  and blaze test --nocache_test_results //ops/netdeploy/netdesign/client/test:js_build_test_strict
  and echo "/client/test..."
  and dh.test > /tmp/test
  and cat /tmp/test
  and echo "deploying..."
  and dh.deploy > /tmp/deploy
  and cat /tmp/deploy
end
