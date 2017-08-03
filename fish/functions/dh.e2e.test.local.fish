function dh.e2e.test.local
	if begin; test (count $argv) -gt 1; end
    blaze test --nocache_test_results --notest_loasd --test_strategy=local --test_output=streamed \
    //ops/netdeploy/netdesign/e2e:$argv[1] \
    --test_arg="--params.tag=$argv[2]" \
    --test_arg="--params.username=mmpatel" \
    --test_arg="--params.isLaunchServerEnabled=true" \
    --test_arg="--params.testTrackerEffortId=" \
    --test_arg="--params.testTrackerEnvironmnet="
  else
  echo $argv[1]
    blaze test --nocache_test_results --notest_loasd --test_strategy=local --test_output=streamed --test_timeout=3600 \
    //ops/netdeploy/netdesign/e2e:$argv[1] \
    --test_arg="--params.username=mmpatel" \
    --test_arg="--params.testTrackerEffortId=" \
    --test_arg="--params.testTrackerEnvironmnet="
  end
end
