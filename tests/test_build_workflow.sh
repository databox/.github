#!/bin/bash

ref=$1

#TODO: 
#  - Add tests for the build workflow

#authorize the github cli with GitHub token
gh auth login --with-token $GITHUB_TOKEN

#run semantic versioning test
gh workflow run "Tag check" \
  -f tag="v1.0.0" \

#run non-semantic versioning test
# echo '{"tag":"@databox/react-monorepo-benchmark@0.0.1", "extract_semver_from_tag":"true"}' | gh workflow run tag-check.yml -r $ref --json