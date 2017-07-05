function dh.check
	tricorder analyze -categories JavaScript -fix
  blaze test --nocache_test_results //ops/netdeploy/netdesign/client/test:js_build_test_strict 
  dh.test
end
