#!/usr/bin/env bash
set -x
# Set err=1 if any commands exit with non-zero status as described in
# https://stackoverflow.com/a/42219754
err=0
trap 'err=1' ERR
export MLFLOW_HOME=$(pwd)

pytest tests/store/artifact/test_sftp_artifact_repo.py --requires-ssh --ignore-flavors --ignore=tests/examples

test $err = 0
