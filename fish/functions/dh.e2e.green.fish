function dh.e2e.green
	/google/data/ro/projects/testing/integrate/guitar_oneshot.par \
   --cluster_name=doublehelix-web-e2e -c $argv[1] -w 'doublehelix-e2e-green' \
   --env_params="TESTTRACKER_EFFORT_ID=,TESTTRACKER_ENVIRONMENT=,DATAFROM=hermetic"
end
