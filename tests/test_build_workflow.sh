#!/bin/bash

ref=$1

#TODO: 
#  - Add tests for the build workflow

#authorize the github cli with GitHub token
gh auth login --with-token $GITHUB_TOKEN

#run semantic versioning test
gh workflow run "tag-check.yml" \
  -f tag="1.0.0" \
  -f runner="ubuntu-latest" \
  -r $ref


gh workflow run "tag-check.yml" \
  -f tag="@databox/react-monorepo-benchmark@0.0.2" \
  -f tag_check_regex="^@.+react-monorepo-benchmark.*@[0-9]+.[0-9]+.[0-9]+(-alpha.[0-9]+)?$" \
  -f extract_semver_from_tag="true" \
  -f tag_extract_regex="([^@]+)$" \
  -f runner="ubuntu-latest" \
  -r $ref

