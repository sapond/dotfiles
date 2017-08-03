function dh.submit
	g5 sync
  g5 export
  g5 lint
  blaze test //ops/netdeploy/netdesign/client/test:js_build_test_strict
  g5 submit
end
