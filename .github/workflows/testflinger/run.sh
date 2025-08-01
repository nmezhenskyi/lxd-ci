#!/bin/bash -eu

temp_job=uc-nvidia-job.yml.tmp

echo "Inputs: $JOB_QUEUE $DISTRO $SNAP_CHANNEL"

# Replace env vars with inputs
envsubst '$JOB_QUEUE $DISTRO $SNAP_CHANNEL' < uc-nvidia-cdi-job.yml > $temp_job

if [[ "${1:-}" == "--dryrun" ]]; then
  echo "Dry-run complete"
  echo "Submit the job with:"
  echo "testflinger submit --poll $temp_job"
  exit 0
fi

# Submit the modified job
testflinger submit --poll $temp_job
