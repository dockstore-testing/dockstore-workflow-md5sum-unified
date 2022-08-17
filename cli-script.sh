#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

ls
dockstore --script  workflow launch --local-entry checker_workflow_wrapping_workflow.cwl --json md5sum.json
dockstore --script  workflow launch --local-entry checker_workflow_wrapping_tool.cwl --json md5sum.json

